//
//  Menu.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct ScrollMenu: View {
    // MARK: - Props
    @State private var index = 0
    @Binding var isSelected: String
    private let menuItems = ["All", "Outdoor", "Indoor", "Big Plants", "Little"]
    
    // MARK: - Methods
    fileprivate func menuItem(_ name: String, id: Int) -> some View {
        Button(action: {
            isSelected = name
        }, label: {
            VStack( content: {
                if isSelected == name {
                    VStack(spacing: 1.0, content: {
                        Text(name)
                            .foregroundColor(Color.accentColor)
                        Rectangle()
                            .frame(height: 2)
                    })
                } else {
                    VStack(content: {
                        Text(name)
                            .foregroundColor(Color("Text"))
                    })
                }
            })
            .font(Font.custom("SourceSansPro-SemiBold", size: 18))
            .padding(.horizontal)
            .padding(.top, -16)
            .frame(height: 60, alignment: .leading)
        })
    }
    
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .top, content: {
                ForEach(menuItems, id: \.self) { index in
                    (menuItem(index, id: index.hashValue))
                }
            })
        })
    }
}



// MARK: - Preview
struct ScrollMenu_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMenu(isSelected: .constant("All"))
    }
}
