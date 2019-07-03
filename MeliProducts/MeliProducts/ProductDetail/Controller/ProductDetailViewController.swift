//
//  ProductDetailViewController.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let productViewModel: ProductDetailViewModelProtocol
    
    init(product: Product) {
        self.productViewModel = ProductDetailViewModel(product)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let productDetailView = ProductDetailView()
        productDetailView.viewModel = productViewModel
        view = productDetailView
    }
}
