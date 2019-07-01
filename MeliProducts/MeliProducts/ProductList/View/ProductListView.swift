//
//  ProductListView.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import SnapKit

class ProductListView: UIView {
    
    let contentView: UIView
    let tableView: UITableView
    let adapter: ProductListAdapter
    
    public var viewModel: ProductListViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    public override init(frame: CGRect) {
        contentView = UIView()
        tableView = UITableView()
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
            tableView.top.equalTo(contentView.snp_topMargin)
            tableView.left.equalTo(contentView.snp.left)
            tableView.right.equalTo(contentView.snp_rightMargin)
            tableView.bottom.equalTo(contentView.snp_bottomMargin)
        }
    }
    
    func configure() {
        contentView.backgroundColor = UIColor(red: 255 / 255.0, green: 236 / 255.0, blue: 106 / 255.0, alpha: 1)
        tableView.backgroundColor = UIColor.white
    }
}
