//
//  Created by matheus.feola on 30/06/19.
//

import UIKit

public protocol ViewCodable {
    
    func buildHierarchy()
    func buildConstraints()
    func configure()
    func render()
    func setupView()
}

public extension ViewCodable {
    
    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
    }
    
    func render() {}
}

