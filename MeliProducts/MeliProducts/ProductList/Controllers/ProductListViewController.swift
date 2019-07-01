//
//  ProductListViewController.swift
//  MeliProducts
//
//  Created by matheus.feola on 29/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private let service: ProductServiceProtocol
    private var productListView: ProductListView
    
    init(service: ProductServiceProtocol = ProductService()) {
        self.service = service
        productListView = ProductListView(frame: UIScreen.main.bounds)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        service = ProductService()
        productListView = ProductListView(frame: UIScreen.main.bounds)
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        self.view = productListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        service.productDetail(productId: "MLU445069856") { product in
//
//            print("I'm selling a: \(product.title)")
//
//        }
        
        service.search("TV") { productList in
            self.productListView.viewModel = ProductListViewModel(list: productList)
        }
    }
}

