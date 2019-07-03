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
    private let title: UILabel
    private let price: UILabel
    
    public var viewModel: ProductDetailViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        contentView = UIView()
        image = UIImageView()
        title = UILabel()
        price = UILabel()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        if let viewModel = viewModel {
            
            title.text = viewModel.product.title
            price.text = "$ \(String(viewModel.product.price))"
            
            if let picture = viewModel.product.pictures {
                image.kf.setImage(with: picture[0].secure_url)
            }
        }
    }
}
extension ProductDetailView: ViewCodable {
    
    func buildHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(title)
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
        
        title.snp.makeConstraints { title in
            title.top.equalTo(image.snp.bottom).offset(16)
            title.left.equalTo(image.snp.left)
            title.right.equalTo(image.snp.right)
        }
        
        price.snp.makeConstraints { price in
            price.top.equalTo(title.snp.bottom).offset(12)
            price.left.equalTo(image.snp.left)
            price.right.equalTo(image.snp.right)
        }
    }
    func configure() {
        backgroundColor = UIColor.white
        
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = UIColor.black
        title.numberOfLines = 3
        price.textColor = UIColor.AppColors.mainGreen
        price.font = UIFont.systemFont(ofSize: 16)
    }
}
