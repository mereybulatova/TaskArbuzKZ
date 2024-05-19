//
//  ProductDetailView.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 20.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    @State var quantity: Int = 0
    
    var body: some View {
        VStack {
            if let product = viewModel.product {
                Image(product.imageName)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 280)
                    .cornerRadius(20)
                
                Text(product.title)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.mainGray)
                
                Text("\(product.price) ₸/шт")
                    .font(.headline.bold())
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.lightGray)
                
                
                Button(action: {
                    let position = Position(id: UUID().uuidString, product: viewModel.product!, count: self.quantity)
                    CartViewModel.shared.addPosition(position)
                }) {
                    HStack {
                        if quantity > 0 {
                            HStack {
                                Button(action: {
                                    if quantity > 0 {
                                        quantity -= 1
                                    }
                                }) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                VStack {
                                    Text("\((viewModel.product?.price ?? 100) * quantity) ₸")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 10)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text("\(quantity) шт")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 10)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                
                                Button(action: {
                                    quantity += 1
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .frame(maxWidth: .infinity, minHeight: 35, maxHeight: 50)
                            .background(Color.lightGreen)
                            .cornerRadius(10)
                        } else {
                            Button(action: {
                                quantity = product.minAddPosition
                            }) {
                                HStack {
                                    Text("\(product.price) ₸")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .padding(.leading, 12)
                                        .foregroundColor(.white)
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding(.trailing, 12)
                                }
                                .frame(maxWidth: .infinity, minHeight: 35, maxHeight: 50)
                                .background(Color.lightGreen)
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                }
                Spacer()
            } else {
                Text("Загрузка данных...")
            }
        }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "", title: "Очень вкусная бузанка хлебаfjkndjndkjfnbkd", imageName: "placeholder", price: 1000, minAddPosition: 1)))
}
