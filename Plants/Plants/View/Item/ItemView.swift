//
//  ItemView.swift
//  Plants
//
//  Created by A A on 20.08.2021.
//

import SwiftUI

struct ItemView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: .topLeading , content: {
            Button(action: { withAnimation(.linear(duration: 0.5)) {
                viewRouter.currentPage = .page1
            }}, label: {
                ZStack(content: {
                    rectangleShape(cornerRadius: 12)
                        .shadowed()
                    Image(systemName: "chevron.left")
                })
                .frame(width: 40, height: 40)
            })
            .zIndex(1)
            .padding()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(content: {
                    ZStack(content: {
                        Group {
                            rectangleShape(cornerRadius: 230).shadowed()
                            rectangleShape(cornerRadius: 220).innerShadowed(cornerRadius: 230)
                        }
                        .frame(width: 460, height: 460)
                        Image("Monstera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 275)
                            .padding(.top, 100)
                            .padding(.leading, 50)
                    })
                    .padding(.top, -150)
                    
                    ChoosePot()
                        .padding(.vertical)
                    VStack(alignment: .leading, content: {
                        Text("Monstera Deliciosa")
                            .font(.custom("SourceSansPro-SemiBold", size: 24))
                            .padding(.bottom, 8)
                        Text("Monstera deliciosa, commonly called split-leaf philodendron, is native to Central America. It is a climbing, evergreen perennial vine that is perhaps most noted for its large perforated leaves on thick plant stems and its long cord-like aerial roots.")
                            .font(.custom("SourceSansPro-Regular", size: 17))
                            .opacity(0.7)
                    })
                    .foregroundColor(Color("Title"))
                    Spacer()
                    Footer()
                })
                .padding()
            })
        })
        .foregroundColor(Color("Text"))
        .clipped()
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView().environmentObject(ViewRouter())
    }
}
