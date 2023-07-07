//
//  ContentView.swift
//  Joke
//
//  Created by Adil Mustafa Yılmaz on 6.07.2023.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var jokes: FetchedResults<Joke>
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    
    var body: some View {
        VStack {
            List {
            ForEach(jokes) {element in
                Text(element.value ?? "Unknown")
                
            }.onDelete(perform: removeJokes)
                
            }
            
            Button("Add") {
                
                jokesVM.getJoke()
                let name = Joke(context: moc)
                
                name.id = UUID()
                name.value = jokesVM.joke
                
                
                
                try? moc.save()
            }
        }
    }
    
    
    func removeJokes(at offset: IndexSet){
        for index in offset {
            let jke  = jokes[index]
            moc.delete(jke)
            
        }
        do {
            try moc.save()
        } catch {
            print("Error occured while saving the data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

