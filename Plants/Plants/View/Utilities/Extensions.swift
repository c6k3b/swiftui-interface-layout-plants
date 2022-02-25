//
//  Extensions.swift
//  Plants
//
//  Created by A A on 17.08.2021.
//

import SwiftUI

extension View {
    // MARK: - Shapes
    func rectangleShape(cornerRadius: CGFloat) -> some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(Color("Background"))
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(LinearGradient(gradient: Gradient(colors: [Color("Shadow").opacity(0.19788), Color.white.opacity(0.001)]),
                                     startPoint: UnitPoint(x: 0.25, y: 0.5),
                                     endPoint: UnitPoint(x: 0.75, y: 0.5)))
                .blendMode(.multiply)
        })
        .compositingGroup()
        //.drawingGroup()
    }
    

    func curvedShape(screenWidth: CGFloat, shapeHeight: CGFloat) -> some View {
        let radius = shapeHeight / 2
        let left =  Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: screenWidth, y: 0))
            path.addRelativeArc(center: CGPoint(x: screenWidth - shapeHeight / 2, y: shapeHeight / 2),
                                radius: radius, startAngle: .degrees(0), delta: .degrees(90))
            path.addRelativeArc(center: CGPoint(x: screenWidth / 2 + shapeHeight / 1.2, y: shapeHeight / 2),
                                radius: radius, startAngle: .degrees(90), delta: Angle(degrees: 45))
            path.addRelativeArc(center: CGPoint(x: screenWidth / 2, y: shapeHeight),
                                radius: radius , startAngle: .degrees(-45), delta: .degrees(-60))
            path.addLine(to: CGPoint(x: screenWidth / 2, y: 0))
        }
        let right = left.rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
        
        return HStack(content: {
            left
            right
        })
        .rotationEffect(.degrees(180))
        .frame(height: 85)
        .foregroundColor(Color("Background"))
        //.drawingGroup()
    }
    
    
    
    // MARK: - Shadows
    func shadowed() -> some View {
        self
            .shadow(color: Color.white, radius: 8, x: -4, y: -4)
            .shadow(color: Color("Shadow"), radius: 8, x: 4, y: 4)
    }
    
    
    ///
    func innerShadowed(cornerRadius: CGFloat) -> some View {
        self
            .overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(Color.white, lineWidth: 4)
                        .shadow(color: Color.white, radius: 8, x: -4, y: -4)
                        .mask(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            )
            .overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(Color("Shadow").opacity(0.4), lineWidth: 4)
                        .shadow(color: Color("Shadow"), radius: 8, x: 4, y: 4)
                        .offset(x: 2, y: 2)
                        .mask(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            )
            .drawingGroup()
    }
    
}
