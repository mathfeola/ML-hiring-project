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
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = EmptyListView(.initialState, frame: UIScreen.main.bounds)
        productListView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarStyle()
        didSearchedProduct("TV")
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
            navBar.tintColor = UIColor.AppColors.mainBlue
            navigationItem.titleView = productListView.searchBar
        }
    }
}

extension ProductListViewController: ProductListDelegate {
    
    func didSelectedProduct(_ productId: String) {
        
        self.showLoading()
        
        service.productDetail(productId: productId) { [weak self] response in
            
            switch response {
            case .success(let product):
                self?.delegate?.didSelectProduct(product)
                self?.hideLoading()
            case .failure:
                break
                
            }
        }
    }
    
    func didSearchedProduct(_ searchTerm: String) {
        
        self.showLoading()
        
        service.search(searchTerm) { response in
            
            switch response {
            case .success(let productList):
                
                if productList.results.isEmpty {
                    self.view = EmptyListView(.noProductsFound, frame: UIScreen.main.bounds)
                    self.hideLoading()
                } else {
                    self.productListView.viewModel = ProductListViewModel(list: productList)
                    self.view = self.productListView
                    self.hideLoading()
                }
                
            case .failure:
                self.view = EmptyListView(.networkingError, frame: UIScreen.main.bounds)
                self.hideLoading()
            }
        }
    }
}

