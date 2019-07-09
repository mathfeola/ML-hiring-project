//
//  ProductDetailViewControllerSpec.swift
//  MeliProductsTests
//
//  Created by matheus.feola on 06/07/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MeliProducts

class ProductDetailViewControllerSpec: QuickSpec {
    
    var sut: ProductDetailViewController!
    
    override func spec() {
        describe("ProductDetailViewController") {
            
            context("Setting initial state") {
                
                beforeEach {
                    
                    let product: Product = Loader.fixture("Product")!
                    
                    self.sut = ProductDetailViewController(product: product)
                    _ = self.sut.view
                }
                
                it("should have a view of type") {
                    expect(self.sut.view).to(beAKindOf(ProductDetailView.self))
                }
            }
        }
    }
}
