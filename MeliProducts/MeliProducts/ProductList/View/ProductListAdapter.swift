//
//  ProductListAdapter.swift
//  MeliProducts
//
//  Created by matheus.feola on 30/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

class ProductListAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView: UITableView
    var list: [Product]
    typealias Cell = ProductCellView
    
    var didTappedProduct: ((String) -> Void)?
    
    init(tableView: UITableView) {
        self.tableView = tableView
        list = []
        super.init()
        self.configure()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCellView.identifier, for: indexPath) as? ProductCellView
        
        cell?.setupData(product: list[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let action = didTappedProduct {
            action(list[indexPath.row].id)
        }
    }
    
    // MARK: Private Methods
    
    private func configure() {
        tableView.register(ProductCellView.self, forCellReuseIdentifier: ProductCellView.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
}
