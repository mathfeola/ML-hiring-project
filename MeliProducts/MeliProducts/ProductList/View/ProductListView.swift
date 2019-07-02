//
//  ProductListView.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import SnapKit

protocol ProductListDelegate: class {
    func didSelectedProduct(_ productId: String)
    func didSearchedProduct(_ searchTerm: String)
}

class ProductListView: UIView {
    
    private let contentView: UIView
    private let tableView: UITableView
    private let adapter: ProductListAdapter
    private(set) var searchBar = UISearchBar()
    weak var delegate: ProductListDelegate?
    
    public var viewModel: ProductListViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    override init(frame: CGRect) {
        contentView = UIView()
        tableView = UITableView()
        adapter = ProductListAdapter(tableView: tableView)
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func update() {
        if let viewModel = viewModel {
            adapter.list = viewModel.list.results
            adapter.reloadData()
        }
    }
}

extension ProductListView: ViewCodable {
    
    func buildHierarchy() {
        contentView.addSubview(tableView)
        addSubview(contentView)
    }
    
    func buildConstraints() {
        
        contentView.snp.makeConstraints { contentView in
            contentView.top.equalTo(self)
            contentView.left.equalTo(self)
            contentView.right.equalTo(self)
            contentView.bottom.equalTo(self)
        }

        tableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(contentView.snp.top)
            tableView.left.equalTo(contentView.snp.left)
            tableView.right.equalTo(contentView.snp.right)
            tableView.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    func configure() {
        tableView.backgroundColor = UIColor.white
        configureSearchBar()
        
        adapter.didTappedProduct = { [weak self] productId in
            self?.delegate?.didSelectedProduct(productId)
        }
    }
    
    private func configureSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.keyboardType = UIKeyboardType.alphabet
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.sizeToFit()
    }
}

extension ProductListView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text else {
            return
        }
        delegate?.didSearchedProduct(searchTerm)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
