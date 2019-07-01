//
//  ProductService.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Alamofire

class ProductService: ProductServiceProtocol {
    
    func search(_ searchTerm: String, then completion: @escaping (ProductList) -> Void) {
        
        let router = ProductRouter.search(searchTerm: searchTerm)
        
        ApiClient.sharedApliClient.execute(router: router) { data in
            
            do {
                let list = try JSONDecoder().decode(ProductList.self, from: data)
                
                completion(list)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func productDetail(productId: String, then completion: @escaping (Product) -> Void) {
        
        let router = ProductRouter.detail(productId: productId)
        
        ApiClient.sharedApliClient.execute(router: router) { data in
            
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                
                completion(product)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
