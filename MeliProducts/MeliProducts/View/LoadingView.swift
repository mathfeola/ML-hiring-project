//
//  Created by matheus.feola on 30/06/19.
//

import Foundation
import UIKit

protocol Loadable {
    var activityIndicatorView: LoadingView { get }
}

final class LoadingView: UIView, ViewCodable {

    static let viewInstance: LoadingView = LoadingView()
    
    var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildConstraints() {
        
        self.indicator.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func buildHierarchy() {
        self.addSubview(self.indicator)
    }
    
    func configure() {
        self.indicator.style = .whiteLarge
        self.indicator.startAnimating()
        self.backgroundColor = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 0.0/255.0, alpha: 1)
    }
}
