//
//  JokeApp.swift
//  Joke
//
//  Created by Adil Mustafa Yılmaz on 6.07.2023.
//

import SwiftUI

@main
struct JokeApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
