//
//  ProductServiceMock.swift
//  MeliProductsTests
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Alamofire
@testable import MeliProducts

class ProductServiceMock: ProductServiceProtocol {
    
    var error: Error?
    
    init(error: Error? = nil) {
        self.error = error
    }
    func productDetail(productId: String, then completion: @escaping (Product) -> Void) {
        
    }
    
    func search(_ searchTerm: String, then completion: @escaping (ProductList) -> Void) {
        
    }
}
