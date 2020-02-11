//
//  Created by matheus.feola on 30/06/19.
//

import UIKit
import Kingfisher

protocol ProductDetailViewDelegate: class {
    func didPressShareButton()
    func didPressBuyButton()
}

final class ProductDetailView: UIView {
    private let contentView: UIScrollView
    private let image: UIImageView
    private let title: UILabel
    private let price: UILabel
    private let shareButton: UIButton
    private let buyButton: UIButton
    weak var delegate: ProductDetailViewDelegate?
    
    public var viewModel: ProductDetailViewModelProtocol? {
        didSet {
            updateView()
        }
    }
    
    @objc
    func pressBuyButton(_ sender: UIButton) {
        delegate?.didPressBuyButton()
    }
    
    @objc
    func pressShareButton(_ sender: UIButton) {
        delegate?.didPressShareButton()
    }
    
    override init(frame: CGRect) {
        contentView = UIScrollView()
        image = UIImageView()
        title = UILabel()
        price = UILabel()
        shareButton = UIButton()
        buyButton = UIButton()
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
    
   
    func configure() {
        backgroundColor = UIColor.white
        
        image.contentMode = .scaleAspectFit
        
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textColor = UIColor.black
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.preferredMaxLayoutWidth = UIScreen.main.bounds.width
        
        price.textColor = UIColor.AppColors.mainGreen
        price.font = UIFont.systemFont(ofSize: 18)
        
        buyButton.setTitle("Comprar", for: .normal)
        buyButton.backgroundColor = UIColor.AppColors.mainBlue
        buyButton.layer.cornerRadius = 3
        buyButton.addTarget(self, action: #selector(pressBuyButton(_:)), for: .touchUpInside)
        
        shareButton.setTitle("Compartilhar", for: .normal)
        shareButton.backgroundColor = UIColor.AppColors.mainBlue
        shareButton.layer.cornerRadius = 3
        shareButton.addTarget(self, action: #selector(pressShareButton(_:)), for: .touchUpInside)
    }
    
    func buildHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(price)
        contentView.addSubview(buyButton)
        contentView.addSubview(shareButton)
        addSubview(contentView)
    }
    
    func buildConstraints() {
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(12)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(12)
            make.left.equalTo(contentView.snp.left).offset(12)
            make.right.equalTo(contentView.snp.right).offset(-12)
        }
        
        price.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(12)
            make.left.equalTo(title.snp.left)
        }
        
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).offset(12)
            make.right.equalTo(contentView.snp.centerX)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
        
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(buyButton.snp.top)
            make.left.equalTo(buyButton.snp.right).offset(2)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
    }
}
