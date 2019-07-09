//
//  Router.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Alamofire

protocol Router: URLConvertible {
    typealias Method = HTTPMethod
    var method: Method { get }
    var path: String { get }
}

extension Router {
    func asURL() throws -> URL {
        
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
