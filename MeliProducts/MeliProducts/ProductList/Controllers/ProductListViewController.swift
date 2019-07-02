//
//  ProductListViewController.swift
//  MeliProducts
//
//  Created by matheus.feola on 29/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

protocol ProductListViewControllerDelegate: class {
    func didSelectProduct(_ product: Product)
}

class ProductListViewController: UIViewController {
    
    private let service: ProductServiceProtocol
    private var productListView: ProductListView
    var delegate: ProductListViewControllerDelegate?
    
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
        productListView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.search("TV") { productList in
            self.productListView.viewModel = ProductListViewModel(list: productList)
        }
        setBarStyle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.view.setNeedsLayout()
        navigationController?.view.layoutIfNeeded()
    }
    
    // MARK: Private Methods
    
    private func setBarStyle() {
        extendedLayoutIncludesOpaqueBars = true
        if let navBar = navigationController?.navigationBar {
            navBar.isTranslucent = false
            navBar.barTintColor = UIColor.AppColors.mainYellow
            navigationItem.titleView = productListView.searchBar
        }
    }
}

extension ProductListViewController: ProductListDelegate {
    
    func didSelectedProduct(_ productId: String) {
        service.productDetail(productId: productId) { [weak self] product in
            self?.delegate?.didSelectProduct(product)
        }
    }
    
    func didSearchedProduct(_ searchTerm: String) {
        service.search(searchTerm) { productList in
            self.productListView.viewModel = ProductListViewModel(list: productList)
        }
    }
}

