//
//  Created by matheus.feola on 30/06/19.
//

import UIKit

final class EmptyListView: UIView {
    
    enum EmptyListState {
        case networkingError
        case noProductsFound
        case initialState
        
        func getErrorMessage() -> (title: String, subtitle: String) {
            switch self {
            case .initialState:
                return (title: "Busque algo novo para você!", subtitle: "")
            case .networkingError:
                return (title: "Houve um problema", subtitle: "Erro de conexão")
            case .noProductsFound:
                return (title: "Nenhum produto encontrado", subtitle: "Tente uma nova busca =D")
            }
        }
        
        func getEmptyListPlaceholderImage() -> UIImage {
            switch self {
            case .initialState:
                return UIImage(named: "initialBackground") ?? UIImage()
            case .networkingError:
                return UIImage()
            case .noProductsFound:
                return UIImage(named: "emptySearch") ?? UIImage()
            }
        }
    }
    
    let title: UILabel
    let emptySearchIcon: UIImageView
    let subtitle: UILabel
    let backgroundImage: UIImageView
    
    init(_ reason: EmptyListState, frame: CGRect) {
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
    
    private func setupEmptyViewState(_ reason: EmptyListState) {
        
        title.text = reason.getErrorMessage().title
        subtitle.text = reason.getErrorMessage().subtitle
        backgroundImage.image = reason.getEmptyListPlaceholderImage()
        
        switch reason {
        case .initialState, .noProductsFound:
            return
        case .networkingError:
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
