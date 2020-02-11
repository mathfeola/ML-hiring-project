//
//  Created by matheus.feola on 30/06/19.
//

import UIKit
import Kingfisher

class ProductCellView: UITableViewCell {
    static let identifier = "productCellView"
    
    var containerView: UIView
    var productImage: UIImageView
    var title: UILabel
    var price: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        containerView = UIView()
        title = UILabel()
        productImage = UIImageView()
        price = UILabel()
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
        if let product = product {
            
            if let imageUrl = URL(string: product.thumbnail ?? "")  {
                
                productImage.kf.setImage(with: imageUrl, placeholder: UIImage(named: "placeholder"), options:[.transition(.fade(0.2))])
            }
            
            title.text = product.title
            price.text = "$ \(String(product.price))"
        }
    }
}

extension ProductCellView: ViewCodable {
    
    func buildHierarchy() {
        containerView.addSubview(productImage)
        containerView.addSubview(title)
        containerView.addSubview(price)
        addSubview(containerView)
    }
    
    func buildConstraints() {
        
        containerView.snp.makeConstraints { container in
            container.top.equalTo(self.snp.top).offset(5)
            container.left.equalTo(self.snp.left).offset(5)
            container.right.equalTo(self.snp.right).offset(-5)
            container.bottom.equalTo(self.snp.bottom).offset(-5)
        }
        
        productImage.snp.makeConstraints { image in
            image.top.equalTo(containerView.snp.top).offset(12)
            image.left.equalTo(containerView.snp.left).offset(12)
            image.bottom.equalTo(containerView.snp.bottom).offset(-12)
            image.width.equalTo(90)
        }
        
        title.snp.makeConstraints { title in
            title.top.equalTo(productImage.snp.top)
            title.left.equalTo(productImage.snp.right).offset(10)
            title.right.equalTo(containerView.snp.right).offset(-12)
        }
        
        price.snp.makeConstraints { price in
            price.top.equalTo(title.snp.bottom).offset(8)
            price.left.equalTo(title.snp.left)
            price.right.equalTo(title.snp.right)
        }
    }
    
    func configure() {
        title.textColor = UIColor.black
        title.numberOfLines = 2
        title.font = UIFont.boldSystemFont(ofSize: 14)
        price.textColor = UIColor.AppColors.mainGreen
        productImage.contentMode = .scaleAspectFit
    }
}
