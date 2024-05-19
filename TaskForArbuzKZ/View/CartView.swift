//
//  CartView.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    @State private var isLoading = false
    @State private var isShowingNextView = false
    
    var body: some View {
        VStack {
            if viewModel.positions.isEmpty {
                VStack(spacing: 8) {
                    Image("emptyCart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .padding(.bottom, 30)
                    
                    Text("Ваша корзина пока пуста")
                        .font(.title2)
                        .foregroundColor(.mainGray)
                        .fontWeight(.bold)
                    
                    Text("Здесь будут лежать товары для покупки")
                        .font(.callout)
                        .foregroundColor(.lightGray)
                        .fontWeight(.bold)
                }
            } else {
                VStack {
                    List(viewModel.positions) { position in
                        PositionCell(position: position) {
                            viewModel.removePosition(withID: position.id)
                        } onCountChange: { newCount in
                            viewModel.updatePositionCount(for: position.id, newCount: newCount)
                        }
                    }
                    .listStyle(.plain)
                    
                    if viewModel.cost < 8000 {
                        HStack {
                            Image(systemName: "truck.box")
                                .font(.body.bold())
                                .foregroundColor(.darkGray)
                                .padding(8)
                            
                            Text("Бесплатная доставка, если вы добавите товаров еще на \(8000 - viewModel.cost) ₸ в корзину")
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(.darkGray)
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color.buttonBackground)
                    } else {
                        HStack {
                            Image(systemName: "truck.box")
                                .font(.body.bold())
                                .foregroundColor(.darkGray)
                                .padding(8)
                            
                            Text("Доступна бесплатная доставка!")
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(.darkGray)
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color.buttonBackground)
                    }
                    
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    } else {
                        Button(action: {
                            startLoading()
                        }, label: {
                            Text("Перейти к оплате \n \(self.viewModel.cost) ₸")
                                .frame(maxWidth: .infinity)
                                .font(.body.bold())
                                .padding(12)
                                .foregroundColor(.white)
                                .background(Color.lightGreen)
                                .cornerRadius(20)
                        })
                        .padding(8)
                    }
                    
                }
                .sheet(isPresented: $isShowingNextView, content: {
                    PaymentView()
                })
                .onAppear() {
                    viewModel.updateCost()
                }
            }
        }
    }
    
    private func startLoading() {
        isLoading = true
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
            isLoading = false
            isShowingNextView = true
        }
    }
}

#Preview {
    CartView(viewModel: CartViewModel.shared)
}
