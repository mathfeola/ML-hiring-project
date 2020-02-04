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
    var pictures: [Picture]?
    var thumbnail: String?
    var permalink: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case pictures
        case thumbnail
        case permalink
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.pictures = try container.decodeIfPresent([Picture].self, forKey: .pictures)
        self.title = try container.decode(String.self, forKey: .title)
        self.price = try container.decode(Double.self, forKey: .price)
        self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        self.permalink = try container.decode(String.self, forKey: .permalink)
    }
}
