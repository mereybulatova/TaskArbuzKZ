//
//  TabBarController.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MainView()
            }
            
            .tabItem {
                VStack {
                    Text("Главная")
                    Image(systemName: "house")
                }
            }
            
            CartView()
                .tabItem {
                    VStack {
                        Text("Корзина")
                        Image(systemName: "cart")
                    }
                }
        }
        .accentColor(Color(.lightGreen))
    }
}

#Preview {
    TabBarView()
}
