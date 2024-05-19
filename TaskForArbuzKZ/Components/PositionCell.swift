//
//  PositionCell.swift
//  TaskForArbuzKZ
//
//  Created by Мерей Булатова on 19.05.2024.
//

import SwiftUI

struct PositionCell: View {
    @State var position: Position
    @State private var isLiked: Bool = false
    var onDelete: () -> Void
    let onCountChange: (Int) -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .topTrailing) {
                if position.product.imageName.isEmpty {
                    Image("placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.width * 0.3, height: screen.width * 0.3)
                        .cornerRadius(12)
                        .clipped()
                } else {
                    Image(position.product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.width * 0.3, height: screen.width * 0.3)
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
                .buttonStyle(BorderlessButtonStyle())
            }
            .contentShape(Rectangle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(position.product.title)
                            .font(.caption.bold())
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .lineLimit(2)
                            .foregroundColor(.mainGray)
                        
                        Text("\(position.product.price) ₸/шт")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.lightGray)
                            .multilineTextAlignment(.leading)
                    }
                    
                    Button {
                        onDelete()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.trailing, 2)
                    .foregroundColor(.lightGray)
                    .font(.callout.bold())
                }
                .contentShape(Rectangle())
                
                Spacer()
                
                HStack(spacing: 20) {
                    Stepper("\(self.position.count) шт", value: $position.count, in: self.position.product.minAddPosition...15) {_ in
                        onCountChange(position.count)
                    }
                    .font(.callout.bold())
                    .foregroundColor(.darkGray)
                    
                    Text("\(position.product.price * position.count) ₸")
                        .font(.callout.bold())
                        .foregroundColor(.mainGray)
                        .padding(.trailing, 2)
                }
            }
            .frame(width: screen.width * 0.65, height: screen.width * 0.3)
        }.padding(.horizontal)
    }
}

#Preview {
    PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Очень вкусная буханка хлеба 500 гр, купите не пожалеете", imageName: "", price: 10004, minAddPosition: 4), count: 1), onDelete: {}, onCountChange: {_ in})
}
