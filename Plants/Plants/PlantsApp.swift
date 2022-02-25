//
//  PlantsApp.swift
//  Plants
//
//  Created by A A on 15.08.2021.
//

import SwiftUI

@main
struct PlantsApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewRouter)
        }
    }
}
