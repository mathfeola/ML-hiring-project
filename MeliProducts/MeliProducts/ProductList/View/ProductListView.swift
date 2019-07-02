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
    
    let contentView: UIView
    let searchBar: UISearchBar
    let tableView: UITableView
    let adapter: ProductListAdapter
    weak var delegate: ProductListDelegate?
    
    public var viewModel: ProductListViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    public override init(frame: CGRect) {
        contentView = UIView()
        tableView = UITableView()
        searchBar = UISearchBar()
        adapter = ProductListAdapter(tableView: tableView)
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
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
        contentView.addSubview(searchBar)
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
        
        searchBar.snp.makeConstraints { searchBar in
            searchBar.top.equalTo(contentView.snp.top).offset(64)
            searchBar.left.equalTo(contentView.snp.left)
            searchBar.right.equalTo(contentView.snp.right)
            searchBar.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { tableView in
            tableView.top.equalTo(searchBar.snp.bottom)
            tableView.left.equalTo(contentView.snp.left).offset(16)
            tableView.right.equalTo(contentView.snp.right).offset(-16)
            tableView.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
    func configure() {
        contentView.backgroundColor = UIColor(red: 255 / 255.0, green: 236 / 255.0, blue: 106 / 255.0, alpha: 1)
        tableView.backgroundColor = UIColor.white
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.keyboardType = UIKeyboardType.alphabet
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        
        adapter.didTappedProduct = { [weak self] productId in
            self?.delegate?.didSelectedProduct(productId)
        }
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
