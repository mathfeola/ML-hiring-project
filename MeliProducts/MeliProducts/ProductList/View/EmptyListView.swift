//
//  Created by matheus.feola on 30/06/19.
//

import UIKit

final class EmptyListView: UIView {
    
    enum EmptyListReason: String {
        case networkingError = "Houve um problema"
        case noProductsFound = "Nenhum produto encontrado"
        case initialState = ""
    }
    
    let title: UILabel
    let emptySearchIcon: UIImageView
    let subtitle: UILabel
    let backgroundImage: UIImageView
    
    init(_ reason: EmptyListReason, frame: CGRect) {
        title = UILabel()
        emptySearchIcon = UIImageView()
        subtitle = UILabel()
        backgroundImage = UIImageView()
        super.init(frame: frame)
        setupView()
        setupEmptyViewState(reason)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEmptyViewState(_ reason: EmptyListReason) {
        
        switch reason {
        case .initialState:
            title.text = "Busque algo novo para você!"
            subtitle.text = ""
            backgroundImage.image = UIImage(named: "initialBackground")
        case .networkingError:
            title.text = EmptyListReason.networkingError.rawValue
            subtitle.text = "Erro de conexão"
            emptySearchIcon.image = UIImage(named: "emptySearch")
            backgroundImage.isHidden = true
        case .noProductsFound:
            title.text = EmptyListReason.noProductsFound.rawValue
            subtitle.text = "Tente uma nova busca =D"
            emptySearchIcon.image = UIImage(named: "emptySearch")
            backgroundImage.isHidden = true
        }
    }
}

extension EmptyListView: ViewCodable {
    func buildHierarchy() {
        addSubview(backgroundImage)
        addSubview(title)
        addSubview(emptySearchIcon)
        addSubview(subtitle)
    }
    
    func buildConstraints() {
        
        backgroundImage.snp.makeConstraints { background in
            background.top.equalToSuperview()
            background.left.equalToSuperview()
        }
        
        emptySearchIcon.snp.makeConstraints { image in
            image.centerX.equalTo(self.snp.centerX)
            image.centerY.equalTo(self.snp.centerY)
            image.width.equalTo(120)
            image.height.equalTo(120)
        }
        
        title.snp.makeConstraints { title in
            title.bottom.equalTo(emptySearchIcon.snp.top).offset(-16)
            title.centerX.equalTo(emptySearchIcon.snp.centerX)
        }
        
        subtitle.snp.makeConstraints { subtitle in
            subtitle.top.equalTo(emptySearchIcon.snp.bottom).offset(16)
            subtitle.centerX.equalTo(emptySearchIcon.snp.centerX)
        }
    }
    
    func configure() {
        backgroundColor = UIColor.white
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textColor = UIColor.black
        subtitle.font = UIFont.systemFont(ofSize: 16)
        subtitle.textColor = UIColor.black
        emptySearchIcon.contentMode = .scaleAspectFit
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.alpha = 0.5
        backgroundImage.tintColor = UIColor.AppColors.mainYellow
    }
}
