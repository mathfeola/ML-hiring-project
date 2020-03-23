//
//  Created by matheus.feola on 30/06/19.
//

import Foundation

enum NetworkingError: Error {
    case requestError(errorDescription: String)
    case parsingError
}

struct ProductService: ProductServiceProtocol {
    
    func search(_ searchTerm: String, then completion: @escaping (Result<ProductList, NetworkingError>) -> Void) {
        
        let router = ProductRouter.search(searchTerm: searchTerm)
        
        ApiClient.sharedApiClient.execute(router: router) { response in
            
            switch response {
            case .success(let data):
                
                do {
                    let list = try JSONDecoder().decode(ProductList.self, from: data)
                    
                    completion(.success(list))
                    
                } catch {
                    completion(.failure(.parsingError))
                }
                
            case .failure(let requestError):
                completion(.failure(NetworkingError.requestError(errorDescription: requestError.localizedDescription)))
            }
        }
    }
    
    func productDetail(productId: String, then completion: @escaping (Result<Product, NetworkingError>) -> Void) {
        
        let router = ProductRouter.detail(productId: productId)
        
        ApiClient.sharedApiClient.execute(router: router) { response in
            
            switch response {
            case .success(let data):
                
                do {
                    let list = try JSONDecoder().decode(Product.self, from: data)
                    
                    completion(.success(list))
                    
                } catch {
                    completion(.failure(.parsingError))
                }
                
            case .failure(let requestError):
                completion(.failure(NetworkingError.requestError(errorDescription: requestError.localizedDescription)))
            }
        }
    }
}
