//
//  MainViewModel.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import Foundation

class MainViewModel: ObservableObject {
    
    static let shared = MainViewModel()
    
    @Published var popularProducts = [
        Product(id: "1",
                title: "Напиток Coca-Cola, газированный 1 л",
                imageName: "cola",
                price: 560,
                minAddPosition: 1),
        Product(id: "2",
                title: "Масло Маслозавод №1 подсолнечное 1 л",
                imageName: "maslo",
                price: 600,
                minAddPosition: 1),
        Product(id: "3",
                title: "Мука Цесна высший сорт 10 кг",
                imageName: "muka",
                price: 4475,
                minAddPosition: 1),
        Product(id: "4",
                title: "Хлеб Брецель гречневый 350 г",
                imageName: "placeholder",
                price: 660,
                minAddPosition: 1)
    ]
    
    @Published var newProducts = [
        Product(id: "5",
                title: "Чипсы Lays Рифленые чили лайм, 140 г",
                imageName: "lays",
                price: 921,
                minAddPosition: 1),
        Product(id: "6",
                title: "Чипсы картофельные Pringles острые с пряным вкусом, 165 г",
                imageName: "pringles",
                price: 2560,
                minAddPosition: 1),
        Product(id: "7",
                title: "Мороженое Magnat classic миндаль белый шоколад 258,4 гр",
                imageName: "magnat",
                price: 3455,
                minAddPosition: 1),
        Product(id: "8",
                title: "Клубника Мурано от Arbuz Select 500 г",
                imageName: "klubnika",
                price: 1100,
                minAddPosition: 1)
    ]
}
