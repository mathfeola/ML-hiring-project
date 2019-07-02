//
//  ViewCodable.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
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
        render()
    }
    
    func render() {}
}

