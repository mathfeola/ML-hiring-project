//
//  ProductListViewControllerSpec.swift
//  MeliProductsTests
//
//  Created by matheus.feola on 06/07/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MeliProducts


class ProductListViewControllerSpec: QuickSpec {
    
    var sut: ProductListViewController!
    
    override func spec() {
        describe("ProductListViewControllerSpec") {
            
            context("Initial state") {
                
                beforeEach {
                    self.sut = ProductListViewController(service: ProductServiceMock())
                    _ = self.sut.view
                }
                
                it("should have a view of type") {
                    expect(self.sut.view).to(beAKindOf(EmptyListView.self))
                }
            }
            
            context("SearchBar behavior") {
                
                beforeEach {
                    self.sut = ProductListViewController(service: ProductServiceMock())
                    _ = self.sut.view
                }
                it("should have a product list view") {
                    self.sut.didSearchedProduct("TV")
                    expect(self.sut.view).to(beAKindOf(ProductListView.self))
                }
            }
            
            context("Error behaviour") {
                
                beforeEach {
                    self.sut = ProductListViewController(service: ProductServiceMock(shouldReturnError: true))
                    _ = self.sut.view
                }
                it("should have a empty view") {
                    expect(self.sut.view).to(beAKindOf(EmptyListView.self))
                    
                }
                
                it("should have a empty view") {
                    self.sut.didSelectedProduct("")
                    expect(self.sut.view).to(beAKindOf(EmptyListView.self))
                }
            }
        }
    }
}
