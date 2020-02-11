//
//  Created by matheus.feola on 30/06/19.
//

import Foundation

protocol ProductDetailViewModelProtocol {
    var product: Product { get }
}

struct ProductDetailViewModel: ProductDetailViewModelProtocol {
    var product: Product
    
    init(_ product: Product) {
        self.product = product
    }
}
