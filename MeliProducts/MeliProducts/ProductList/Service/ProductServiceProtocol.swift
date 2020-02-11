//
//  Created by matheus.feola on 30/06/19.
//

import Foundation

protocol ProductServiceProtocol {
    func productDetail(productId: String, then completion: @escaping (Result<Product, NetworkingError>) -> Void)
    func search(_ searchTerm: String, then completion: @escaping (Result<ProductList, NetworkingError>) -> Void)
}
