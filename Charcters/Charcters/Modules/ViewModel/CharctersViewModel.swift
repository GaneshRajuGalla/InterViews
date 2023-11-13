//
//  CharctersViewModel.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation

@Observable
class CharctersViewModel{
    
    // MARK: - Properties
    
    var characters:[CharcterResult]?
    
    // MARK: - Methods
    
    @MainActor
    func getCharacters() async{
        do{
            let character:Photos = try await APIClient.sendRequest(endpoint: .characters)
            self.characters = character.results
        }catch{
            print("Error: \(error)")
        }
    }
}
