//
//  Router.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation
import Alamofire

protocol Router: URLConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
}
