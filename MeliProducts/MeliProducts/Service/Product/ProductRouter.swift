//
//  ProductRouter.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation

public enum ProductRouter: Router {
    
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
    
    public var path: String {
        switch self {
        case .search(let searchTerm):
            return "/sites/MLU/search?q=\(searchTerm)"
            
        case .detail(let productId):
            return "/items/\(productId)"
        }
    }
    
    public func asURL() throws -> URL {
        
        guard let encodedPath = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("Aborting execution: Could not make baseUrl")
        }
        
        let urlString = EnvironmentSetting().baseUrl + encodedPath
        
        guard let urlRequest = URL(string: urlString) else {
            fatalError("Aborting execution: Could not make baseUrl")
        }
        return urlRequest
    }
}
