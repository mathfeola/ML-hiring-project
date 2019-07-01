//
//  ProductCellView.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

class ProductCellView: UITableViewCell {
    static let identifier = "productCellView"
    
    var productImage: UIImageView
    var title: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        title = UILabel()
        productImage = UIImageView()
        
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: ProductCellView.identifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var product: Product? {
        didSet {
            updateView()
        }
    }
    
    func setupData(product: Product) {
        self.product = product
    }
    
    // MARK: Private Methods
    
    private func updateView() {
        title.text = product?.title
        
        if let product = product {
            
        }
    }
}

extension ProductCellView: ViewCodable {

    func buildHierarchy() {
        addSubview(productImage)
        addSubview(title)
    }
    
    func buildConstraints() {
        
        productImage.snp.makeConstraints { image in
            image.top.equalTo(self.snp.top)
            image.left.equalTo(self.snp.left)
            image.height.equalTo(10)
            image.width.equalTo(10)
        }
        
        title.snp.makeConstraints { title in
            title.top.equalTo(productImage.snp.top)
            title.left.equalTo(productImage.snp.right).offset(10)
        }
        
        //img size = 90 x 90
    }
    
    func configure() {
        title.textColor = UIColor.blue
    }
}
