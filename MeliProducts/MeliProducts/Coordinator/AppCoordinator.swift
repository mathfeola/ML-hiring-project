//
//  AppCoordinator.swift
//  MeliProducts
//
//  Created by matheus.feola on 01/07/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        window.rootViewController = rootViewController
    }
    
    func start() {
        let initialController = ProductListViewController()
        initialController.delegate = self
        rootViewController.present(initialController, animated: false)
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: ProductListViewControllerDelegate {
    func didSelectProduct(_ product: Product) {
        let detailController = ProductDetailViewController(product: product)
        rootViewController.pushViewController(detailController, animated: true)
    }
}
