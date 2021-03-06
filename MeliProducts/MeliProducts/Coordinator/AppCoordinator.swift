//
//  Created by matheus.feola on 01/07/19.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var rootViewController: UINavigationController
    
    init(window: UIWindow, rootViewController: UINavigationController = UINavigationController()) {
        self.window = window
        self.rootViewController = rootViewController
        window.rootViewController = rootViewController
    }
    
    func start() {
        let initialController = ProductListViewController()
        initialController.delegate = self
        rootViewController.pushViewController(initialController, animated: false)
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: ProductListViewControllerDelegate {
    func didSelectProduct(_ product: Product) {
        let detailController = ProductDetailViewController(product: product)
        rootViewController.pushViewController(detailController, animated: true)
    }
}
