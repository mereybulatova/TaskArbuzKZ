//
//  CartViewModel.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() {}
    
    @Published var positions = [Position]()
    @Published var cost: Int = 0
    
    func updateCost() {
        cost = positions.reduce(0) { result, pos in
            let basePrice = pos.product.price * pos.product.minAddPosition
            let finalPrice = pos.product.minAddPosition > 0 ? basePrice * pos.count : pos.product.price * pos.count
            return result + finalPrice
        }
    }
    
    func updatePositionCount(for positionID: String, newCount: Int) {
        if let index = positions.firstIndex(where: { $0.id == positionID }) {
            let oldCount = positions[index].count
                 positions[index].count = newCount
                 let oldPrice = positions[index].product.price * oldCount
                 let newPrice = positions[index].product.price * newCount
                 cost = cost - oldPrice + newPrice
        }
    }
    
    func addPosition(_ position: Position) {
        self.positions.append(position)
    }
    
    func removePosition(withID positionID: String) {
        if let index = positions.firstIndex(where: { $0.id == positionID }) {
            let removedPosition = positions.remove(at: index)
            cost -= (removedPosition.product.price * removedPosition.count)
        }
    }
}
