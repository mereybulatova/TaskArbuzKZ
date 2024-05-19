//
//  ProductDetailViewModel.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 20.05.2024.
//

import Foundation
import UIKit

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: Product?
    @Published var count = 0
    
    init(product: Product) {
        self.product = product
    }
}
