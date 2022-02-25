//
//  ContentView.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var menuSelected = "All"
    @State private var tabBarSelected = "Plants"
    @State private var isInCart = false
    @State private var isShowing = false
    
    var body: some View {
        ZStack(content: {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(alignment: .leading, content: {
                    Header(isShowing: $isShowing)
                    SearchBar().padding(.top, 8)
                    ScrollMenu(isSelected: $menuSelected)
                    CardsView(isInCart: $isInCart).padding(-16)
                    NewsFeed().padding(-16)
                })
                .padding(.horizontal)
            })
            NavBar(tabBarSelected: $tabBarSelected, isShowing: $isShowing)
        })
        .sheet( isPresented: $isShowing, content: {  NewsFeed() })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ViewRouter())
        //            .preferredColorScheme(.dark)
    }
}
