//
//  Encodable.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation
extension Encodable{
    func toDictionary() throws -> [String:Any]{
       let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        do{
            let data = try encoder.encode(self)
            if let jsonData = try JSONSerialization.jsonObject(with: data) as? [String:Any]{
                return jsonData
            }
        }catch{
            print("Error\(error)")
        }
        return [:]
    }
}
