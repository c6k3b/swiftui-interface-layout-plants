//
//  CardsView.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct CardsView: View {
    // MARK: - Props
    @EnvironmentObject var viewRouter: ViewRouter
    @Binding var isInCart: Bool
    
    fileprivate func plantCard(name: String, type: String, price: Int, isInCart: Bool = false) -> some View {
        ZStack(content: {
            rectangleShape(cornerRadius: 20)
                .shadowed()
                .frame(width: 175,height: 260)
            VStack(alignment: .leading, content: {
                /// Image and Description
                Button(action: { withAnimation(.linear(duration: 0.3)) {
                    viewRouter.currentPage = .page2
                }}, label: {
                    Image(name).frame(width: 160, height: 180)
                })
                Text(type)
                    .font(Font.custom("SourceSansPro-Regular", size: 12))
                    .foregroundColor(Color("Text"))
                Text(name).font(Font.custom("SourceSansPro-SemiBold", size: 20))
                /// Price with Add to Cart Button
                HStack(content: {
                    Text("$\(price)")
                        .font(Font.custom("SourceSansPro-SemiBold", size: 22))
                    Spacer()
                    ZStack(content: {
                        if !isInCart {
                            rectangleShape(cornerRadius: 12)
                                .shadowed()
                            Image(systemName: "cart")
                                .foregroundColor(Color("Text"))
                        } else {
                            rectangleShape(cornerRadius: 12)
                                .innerShadowed(cornerRadius: 12)
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color.accentColor.opacity(0.9))
                                .frame(width: 36, height: 36)
                                .blur(radius: 1)
                            Image(systemName: "cart")
                                .foregroundColor(Color.white)
                        }
                    })
                    .frame(width: 40, height: 40)
                    .padding(.trailing)
                })
                .padding(.bottom, 36)
            })
            .padding(.leading)
        })
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing: 24.0, content: {
                plantCard(name: "Monstera", type: "Indoor", price: 26, isInCart: true)
                plantCard(name: "Ficus", type: "Indoor", price: 20, isInCart: false)
                plantCard(name: "Monstera", type: "Indoor", price: 26, isInCart: false)
            })
            .foregroundColor(Color("Title"))
            .padding(.leading)
            .padding(.vertical)
        })
        .background(Color.clear)
        .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
    }
}


// MARK: - Preview
struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(isInCart: .constant(false)).environmentObject(ViewRouter())
        
    }
}
