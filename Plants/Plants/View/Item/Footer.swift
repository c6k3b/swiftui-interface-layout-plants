//
//  Footer.swift
//  Plants
//
//  Created by A A on 20.08.2021.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        HStack(spacing: 16.0, content: {
            Group {
                ZStack(content: {
                    rectangleShape(cornerRadius: 12)
                        .shadowed()
                    Image(systemName: "minus")
                })
                Text("1")
                ZStack(content: {
                    rectangleShape(cornerRadius: 12)
                        .shadowed()
                    rectangleShape(cornerRadius: 12)
                        .innerShadowed(cornerRadius: 12)
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.accentColor.opacity(0.9))
                        .frame(width: 36, height: 36)
                        .blur(radius: 1)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })
            }
            .frame(width: 40, height: 40)
            Spacer()
            ZStack(content: {
                rectangleShape(cornerRadius: 12)
                    .shadowed()
                    .frame(width: 155, height: 56)
                HStack(content: {
                    Text("View cart")
                    Spacer()
                    Image(systemName: "chevron.right")
                })
                .frame(width: 100)
            })
        })
        .font(.custom("SourceSansPro-Regular", size: 18))
        .foregroundColor(Color("Text"))
    }
}

struct Footer_Previews: PreviewProvider {
    static var previews: some View {
        Footer()
    }
}
