//
//  Created by matheus.feola on 30/06/19.
//

import Alamofire

class ApiClient {
    
    static let sharedApiClient = ApiClient()

    public func execute(router: Router,
                        completion: @escaping (Result<Data>) -> Void) {
        
        Alamofire.request(router, method: router.method as HTTPMethod).responseJSON { response in
            
            guard let data = response.data else { return }
            
            switch response.result {
                
            case .success:
                completion(.success(data))
            case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
