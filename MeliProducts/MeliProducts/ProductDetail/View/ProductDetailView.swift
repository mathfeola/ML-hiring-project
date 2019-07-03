//
//  ProductDetailView.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailView: UIView {
    private let contentView: UIView
    private let image: UIImageView
    private let price: UILabel
    
    public var viewModel: ProductDetailViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        contentView = UIView()
        image = UIImageView()
        price = UILabel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        if let viewModel = viewModel {
            if let picture = viewModel.product.pictures {
                image.kf.setImage(with: picture[0].secure_url)
            }
        }
    }
}
extension ProductDetailView: ViewCodable {
    
    func buildHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(price)
        addSubview(contentView)
    }
    
    func buildConstraints() {
        contentView.snp.makeConstraints { contentView in
            contentView.top.equalTo(self)
            contentView.left.equalTo(self)
            contentView.right.equalTo(self)
            contentView.bottom.equalTo(self)
        }
        
        image.snp.makeConstraints { image in
            image.top.equalTo(contentView.snp.top).offset(12)
            image.left.equalTo(contentView.snp.left).offset(12)
            image.right.equalTo(contentView.snp.right).offset(-12)
            image.width.equalTo(250)
            image.height.equalTo(180)
        }    
    }
    func configure() {
        backgroundColor = UIColor.white
    }
}
