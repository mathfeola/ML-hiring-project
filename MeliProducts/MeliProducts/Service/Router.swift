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
        let urlString = EnvironmentSetting().baseUrl + path
        
        guard let urlRequest = URL(string: urlString) else {
            fatalError("Aborting execution: Could not find baseUrl")
        }
        
        return urlRequest
    }
}
