//
//  ProductListViewModel.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation

protocol ProductListViewModelProtocol {
    var list: ProductList { get }
}

struct ProductListViewModel: ProductListViewModelProtocol {
    
    var list: ProductList
    
    init(list: ProductList) {
        self.list = list
    }
}
