//
//  Created by matheus.feola on 30/06/19.
//

import Foundation

enum ProductRouter: Router {
    
    
    case search(searchTerm: String)
    case detail(productId: String)
    
    var method: ProductRouter.Method {
        switch self {
        case .search:
            return .post
        case.detail:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .search(let searchTerm):
            return "/sites/MLU/search?q=\(searchTerm)"
            
        case .detail(let productId):
            return "/items/\(productId)"
        }
    }
}
