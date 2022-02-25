//
//  SearchBar.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct SearchBar: View {
    @State var text: String = ""
    var body: some View {
        VStack {
            ZStack {
                rectangleShape(cornerRadius: 20).frame(height: 60)
                    .innerShadowed(cornerRadius: 20)
                TextField("Search...", text: $text)
                    .frame(width: 250, height: 60)

                HStack(content: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.accentColor).font(.title2)
                    Spacer()
                    ZStack(content: {
                        rectangleShape(cornerRadius: 12)
                            .shadowed()
                            .frame(width: 40, height: 40)
                        Image(systemName: "slider.vertical.3")
                            .foregroundColor(Color("Text"))
                    })
                })
                .padding()
            }
            .font(Font.custom("SourceSansPro-Regular", size: 18))
            .foregroundColor(Color("Text"))
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar().previewLayout(.sizeThatFits)
    }
}



