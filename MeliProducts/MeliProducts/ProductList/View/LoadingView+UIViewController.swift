//
//  LoadingView+UIViewController.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

extension UIViewController: Loadable {
    
    var activityIndicatorView: LoadingView {
        return LoadingView.viewInstance
    }
    
    func showLoading() {
        self.view.addSubview(activityIndicatorView)
        
        self.activityIndicatorView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func hideLoading() {
        activityIndicatorView.removeFromSuperview()
    }
}
