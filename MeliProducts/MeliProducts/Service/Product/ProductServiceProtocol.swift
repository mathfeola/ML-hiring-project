//
//  ProductServiceProtocol.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation
import Alamofire

protocol ProductServiceProtocol {
    func productDetail(productId: String, then completion: @escaping (Product) -> Void)
    func search(_ searchTerm: String, then completion: @escaping (ProductList) -> Void)
}
