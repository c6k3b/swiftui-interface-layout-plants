//
//  Header.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI
import UIKit

struct Header: View {
    // MARK: - Props
    @EnvironmentObject var viewRouter: ViewRouter
    @Binding var isShowing: Bool
    
    fileprivate func Badge() -> some View {
        ZStack(content: {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("BadgeGradient"),Color.accentColor]),
                                     startPoint: UnitPoint(x: 1.5, y: 0.5),
                                     endPoint: UnitPoint(x: 0.5, y: -0.5)))
                .frame(width: 14, height: 14)
            Text("1")
                .font(.caption2)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        })
    }
    
    // MARK: - Body
    var body: some View {
        ZStack(content: {
            Text("Plants")
                .font(Font.custom("SourceSansPro-Bold", size: 24))
                .foregroundColor(Color("Title"))
            HStack(content: {
                Spacer()
                ZStack(content: {
                    rectangleShape(cornerRadius: 12)
                        .shadowed()
                        .frame(width: 40, height: 40)
                    Image(systemName: "bag")
                        .foregroundColor(Color("Text"))
                    Badge()
                        .offset(x: 8, y: 8)
                })
            })
        })
        .onTapGesture {
            withAnimation(.spring()) {
                isShowing = true
            }}
    }
}

// MARK: - Preview
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(isShowing: .constant(false)).previewLayout(.sizeThatFits)
            .environmentObject(ViewRouter())
    }
}
