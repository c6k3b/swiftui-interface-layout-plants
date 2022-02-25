//
//  BasketIcon.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct BasketIcon: View {
    var body: some View {
        ZStack(content: {
            ShadowLine().stroke(Color("Text"), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 4)
            Basket().stroke(Color("Text"), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
        })
        .frame(width: 15, height: 1)
        .padding(.top, -2)
    }
}

struct Basket: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 1, y: 0))
        path.addLine(to: CGPoint(x: 3, y: 7.5))
        path.addLine(to: CGPoint(x: 12, y: 7.5))
        path.addLine(to: CGPoint(x: 14, y: 0))
        
        path.move(to: CGPoint(x: 3, y: 0))
        path.addLine(to: CGPoint(x: 5, y: -4))
        path.move(to: CGPoint(x: 12, y: 0))
        path.addLine(to: CGPoint(x: 10, y: -4))
        return path
    }
}

struct ShadowLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 15, y: 0))
        return path
    }
}


struct BasketIcon_Previews: PreviewProvider {
    static var previews: some View {
        BasketIcon().previewLayout(.fixed(width: 100, height: 100)).padding()
    }
}
