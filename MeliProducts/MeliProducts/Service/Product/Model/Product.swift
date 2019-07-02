//
//  Product.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation

class Product: Codable {
    var id: String
    var title: String
    var price: Double
    var imageResource: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case imageResource = "thumbnail"
    }
}
