//
//  ProductDetailViewModel.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation

protocol ProductDetailViewModelProtocol {
    var product: Product { get }
}

struct ProductDetailViewModel: ProductDetailViewModelProtocol {
    var product: Product
    
    init(_ product: Product) {
        self.product = product
    }
}
