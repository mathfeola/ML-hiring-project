//
//  Created by matheus.feola on 30/06/19.
//

import Foundation

protocol ProductListViewModelProtocol {
    var list: ProductList { get }
}

struct ProductListViewModel: ProductListViewModelProtocol {
    
    var list: ProductList
    
    init(list: ProductList) {
        self.list = list
    }
}
