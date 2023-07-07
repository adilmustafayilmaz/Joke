//
//  JokesViewModel.swift
//  Joke
//
//  Created by Adil Mustafa Yılmaz on 6.07.2023.
//

import Foundation
import Alamofire

class JokesViewModel: ObservableObject {
    
    @Published var joke = String()
    
    init(){
        
        getJoke()
    }
    
    func getJoke(){
        
        AF.request("https://api.chucknorris.io/jokes/random",method: .get).responseDecodable(of:Welcome.self) { response in
            
            switch response.result {
            case .success(let data):
                
                self.joke = data.value
            case .failure(let error):
                print(error)
            }
        }
    }
}
