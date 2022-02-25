//
//  ContentView.swift
//  Plants
//
//  Created by A A on 21.08.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter.currentPage {
        case .page1:
            HomeView()
                .background(Color("Background").edgesIgnoringSafeArea(.all))
                .transition(.slide)
        case .page2:
            ItemView()
                .background(Color("Background").edgesIgnoringSafeArea(.all))
                .transition(.scale)
        case .page3:
            NewsFeed()
                .background(Color("Background").edgesIgnoringSafeArea(.all))
                .transition(.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ViewRouter())
    }
}
