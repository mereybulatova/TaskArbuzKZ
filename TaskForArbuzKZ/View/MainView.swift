//
//  ContentView.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

struct MainView: View {
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    @State private var isShowingDetail = false
    @State private var selectedProduct: Product? = nil
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image("discount")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.width * 0.45)
                    .cornerRadius(12)
                    .clipped()
                    .onTapGesture {
                        isShowingDetail = true
                    }
                    .sheet(isPresented: $isShowingDetail, content: {
                        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "8", title: "Клубника Мурано от Arbuz Select 500 г", imageName: "klubnika", price: 1100, minAddPosition: 1)))
                    })
            }
            
            Text("Популярное")
                .font(.title.bold())
                .foregroundColor(.darkGray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: layout, spacing: 8, content: {
                    ForEach(viewModel.popularProducts, id: \.id) { product in
                        ProductCell(product: product)
                            .onTapGesture {
                                selectedProduct = product
                            }
                    }
                })
            }
            .padding(.horizontal, 12)
            
            Text("Новинки")
                .font(.title.bold())
                .foregroundColor(.darkGray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
            
            LazyVGrid(columns: layout, spacing: 16, content: {
                ForEach(viewModel.newProducts, id: \.id) { item in
                            ProductCell(product: item)
                          .onTapGesture {
                            selectedProduct = item
                        }
                }
            }).padding(.horizontal, 12)
        }
        .sheet(item: $selectedProduct) { product in
            ProductDetailView(viewModel: ProductDetailViewModel(product: product))
        }
    }
}

#Preview {
    MainView()
}
