//
//  ChosePotView.swift
//  Plants
//
//  Created by A A on 20.08.2021.
//

import SwiftUI

struct ChoosePot: View {
    var body: some View {
        VStack(spacing: 10, content: {
            HStack(content: {
                Text("Choose the pot:")
                Spacer()
                Text("See all")
                    .foregroundColor(.accentColor)
            })
            ZStack(content: {
                rectangleShape(cornerRadius: 12).shadowed().frame(height: 80)
                HStack(spacing: 24, content: {
                    Image(systemName: "nosign")
                        .font(.system(size: 32))
                        .foregroundColor(Color("Text"))
                    Image("bjorn-groen")
                    Image("gabriel-wit")
                    Image("era-stamped-taupe")
                    Image("era-stamped-antraciet")
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("Text"))
                })
                .frame(height: 32)
            })
        })
        .font(.custom("SourceSansPro-Regular", size: 18))
        .foregroundColor(Color("Title"))
        .opacity(0.8)
    }
}

struct ChoosePot_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePot()
    }
}
