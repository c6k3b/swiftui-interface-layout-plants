//
//  Navbar.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct NavBar: View {
    // MARK: - Props
    @EnvironmentObject var viewRouter: ViewRouter
    @Binding var tabBarSelected: String
    @Binding var isShowing: Bool
    private let tabBarItems = [("Home", "house"), ("Plants", "leaf"), ("Favorites", "heart"), ("Account", "person")]
    
    
    fileprivate func menuItem(_ name: String, image: String) -> some View {
        Button(action: {
            tabBarSelected = name
        }, label: {
                if tabBarSelected == name {
                    VStack(spacing: 1.0, content: {
                        Image(systemName: "record.circle.fill")
                            .font(.system(size: 14))
                        Text(tabBarSelected)
                            .font(Font.custom("SourceSansPro-Regular", size: 11))
                    })
                    .foregroundColor(Color.accentColor)
                } else {
                    VStack(content: {
                        Image(systemName: image)
                    })
                }
               })
            .font(.title)
            .foregroundColor(Color("Text"))
            .frame(width: 42, height: 40)
    }
    
    fileprivate func cartButton() -> some View {
        ZStack(content: {
            rectangleShape(cornerRadius: 32)
                .shadowed()
            rectangleShape(cornerRadius: 32)
                .innerShadowed(cornerRadius: 32)
            Circle()
                .frame(width: 58, height: 58)
                .foregroundColor(.accentColor)
                .opacity(0.9)
                .blur(radius: 1)
            Image(systemName: "bag")
                .foregroundColor(Color.white)
                .shadow(radius: 8)
                .font(.title)
            Badge()
                .offset(x: 12, y: 12)
        })
        .frame(width: 64, height: 64)
    }
    
    fileprivate func Badge() -> some View {
        ZStack(content: {
            rectangleShape(cornerRadius: 7)
                .shadowed()
                .frame(width: 14, height: 14)
            Text("1")
                .font(.caption2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
        })
    }
    
    
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom, content: {
            /// Menu Shape
            VStack(content: {
                Spacer()
                curvedShape(screenWidth: UIScreen.main.bounds.width, shapeHeight: 84)
                    .overlay(curvedShape(screenWidth: UIScreen.main.bounds.width, shapeHeight: 76)
                                .shadowed()
                                .blendMode(.multiply))
            })
            .edgesIgnoringSafeArea(.bottom)
            /// Menu Buttons
            HStack(spacing: 24, content: {
                ForEach(tabBarItems, id: \.0) { item in
                    if item.0 == "Favorites" {
                        menuItem(item.0, image: item.1).padding(.leading, 100)
                    } else {
                        menuItem(item.0, image: item.1)
                    }
                }
            })
            cartButton()
                .padding(.bottom, 8)
                .onTapGesture { withAnimation(.spring()) { isShowing = true }}
        })
    }
}


// MARK: - Preview
struct Navbar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(tabBarSelected: .constant("Plants"), isShowing: .constant(false)).previewLayout(.sizeThatFits).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/).environmentObject(ViewRouter())
    }
}

