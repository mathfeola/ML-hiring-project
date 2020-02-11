//
//  Created by matheus.feola on 30/06/19.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
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
        productDetailView.delegate = self
        view = productDetailView
    }
}

extension ProductDetailViewController: ProductDetailViewDelegate {
    func didPressShareButton() {
        if let link = URL(string: productViewModel.product.permalink) {
            
            let shareObjects: [Any] = [link]
            
            let activityViewController = UIActivityViewController(activityItems: shareObjects, applicationActivities: nil)
             activityViewController.popoverPresentationController?.sourceView = self.view
            present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func didPressBuyButton() {
        if let link = URL(string: productViewModel.product.permalink) {
            UIApplication.shared.open(link)
        }
    }
}
