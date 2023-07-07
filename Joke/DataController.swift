//
//  DataController.swift
//  Joke
//
//  Created by Adil Mustafa Yılmaz on 6.07.2023.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "JokeHouse")
    
    init(){
        container.loadPersistentStores {  description, error in
            if let error = error {
                print("Core data Failed to load: \(error.localizedDescription)")
            }
        }
    }
}
