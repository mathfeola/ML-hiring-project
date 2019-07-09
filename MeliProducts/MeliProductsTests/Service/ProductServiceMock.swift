//
//  ProductServiceMock.swift
//  MeliProductsTests
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation
@testable import MeliProducts

class ProductServiceMock: ProductServiceProtocol {
    
    private let shouldReturnError: Bool
    var isRequestCalled: Bool = false
    
    init(shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
    
    func productDetail(productId: String, then completion: @escaping (Result<Product, NetworkingError>) -> Void) {
        
        isRequestCalled = true
        
        if shouldReturnError {
            
            completion(.failure(.requestError(errorDescription: "Connection")))
            
        } else {
            
            let product: Product = Loader.fixture("Product")!
            
            completion(.success(product))
            
        }
    }
    
    func search(_ searchTerm: String, then completion: @escaping (Result<ProductList, NetworkingError>) -> Void) {
        
        isRequestCalled = true
        
        if shouldReturnError {
            
            completion(.failure(.requestError(errorDescription: "Connection")))
            
        } else {
            
            let searchList: ProductList = Loader.fixture("TvSearch")!
            
            completion(.success(searchList))
            
        }
    }
}
