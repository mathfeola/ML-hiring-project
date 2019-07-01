//
//  ViewController.swift
//  MeliProducts
//
//  Created by matheus.feola on 29/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let service: ProductServiceProtocol
    
    init(service: ProductServiceProtocol = ProductService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.service = ProductService() // remove later
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.productDetail(productId: "MLU445069856") { product in
            
            print("I'm selling a: \(product.title)")
            
        }
        
        service.search("TV") { productList in
            
            print("And it costs: \(productList.results[1].price)")
        }
    }
}

