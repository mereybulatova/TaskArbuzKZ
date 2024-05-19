//
//  ProductCell.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State private var quantity: Int = 0
    @State private var isLiked: Bool = false
    
    var body: some View {
        VStack(spacing: 2) {
            ZStack(alignment: .topTrailing) {
                
                if product.imageName.isEmpty {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.width * 0.45, height: screen.width * 0.3)
                        .cornerRadius(12)
                        .clipped()
                } else {
                    Image(product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.width * 0.45, height: screen.width * 0.3)
                        .cornerRadius(12)
                        .clipped()
                }
                
                Button(action: {
                    isLiked.toggle()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .darkGray)
                        .padding([.top, .trailing], 8.0)
                }
            }
            
            Text(product.title)
                .font(.caption.bold())
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(.mainGray)
                .padding(.bottom, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 2) {
                Text("\(product.price) ₸/шт")
                    .font(.caption.bold())
                    .foregroundColor(.lightGray)
                    .multilineTextAlignment(.leading)
                
                Text("• \(product.minAddPosition) шт")
                    .font(.caption.bold())
                    .foregroundColor(.lightGreen)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
          
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
                        
                        Text("\(quantity)")
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }.frame(maxWidth: .infinity, minHeight: 35, maxHeight: 40)
                        .background(Color.lightGreen)
                        .cornerRadius(18)
                } else {
                    Button(action: {
                        quantity = product.minAddPosition
                    }) {
                        HStack {
                            Text("\(product.price) ₸")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.leading, 12)
                                .foregroundColor(.darkGray)
                            
                            Spacer(minLength: 6)
                            
                            Image(systemName: "plus")
                                .foregroundColor(.lightGreen)
                                .padding(.trailing, 12)
                        }
                        .frame(maxWidth: .infinity, minHeight: 35, maxHeight: 40)
                        .background(Color.buttonBackground)
                        .cornerRadius(18)
                    }
                }
            }
        }.frame(width: screen.width * 0.45, height: screen.width * 0.58)
            .background(Color(.white))
    }
}

#Preview {
    ProductCell(product: Product(id: "", title: "Очень вкусная буханка хлеба 500 гр", imageName: "", price: 240, minAddPosition: 1))
}
