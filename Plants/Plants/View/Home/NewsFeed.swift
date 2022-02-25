//
//  NewsFeed.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct NewsFeed: View {
    @EnvironmentObject var viewRouter: ViewRouter
    private let colors = Gradient(colors: [Color("Background"), Color("Shadow"), Color("Background"), Color("Shadow")])
    
    fileprivate func Card(text: String, icon: String) -> some View {
        return ZStack(content: {
            rectangleShape(cornerRadius: 20)
                .shadowed()
                .frame(height: 140)
            ZStack(content: {
                rectangleShape(cornerRadius: 16)
                    .innerShadowed(cornerRadius: 16)
                    .overlay(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                    .mask(RoundedRectangle(cornerRadius: 16,style: .continuous))
                    .padding(.horizontal, 8)
                    .frame(height: 124)
                HStack(content: {
                    Text(text)
                        .font(Font.custom("SourceSansPro-Regular", size: 20))
                    Spacer(minLength: 60)
                    ZStack(content: {
                        rectangleShape(cornerRadius: 25)
                            .innerShadowed(cornerRadius: 25)
                            .frame(width: 50, height: 50)
                        Image(systemName: icon)
                            .foregroundColor(.accentColor)
                            .font(.system(size: 25))
                    })
                })
                .padding(32)
            })
        })
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, content: {
                HStack {
                    Text("Care News")
                        .font(Font.custom("SourceSansPro-Bold", size: 24))
                        .foregroundColor(Color("Title").opacity(0.8))
                }
                VStack(content: {
                    Card(text: ("12 Healthy Hacks for Plants"), icon: "wand.and.stars")
                    Card(text: ("12 Healthy Hacks for Plants"), icon: "wand.and.stars")
                        .offset(y: -32)
                })
            })
            .foregroundColor(Color("Title").opacity(0.6))
            .padding()
            .padding(.top)
        })
    }
}

struct NewsFeed_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeed().environmentObject(ViewRouter())
    }
}
