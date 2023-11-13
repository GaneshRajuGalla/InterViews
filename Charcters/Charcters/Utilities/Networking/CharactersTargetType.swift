//
//  CharactersTargetType.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation

enum EndPointType{
    case characters
}

extension EndPointType:TargetType{
    
    var baseUrl: String {
        return "https://rickandmortyapi.com/api"
    }
    
    var path: String {
        switch self {
        case .characters:
            return "/character"
        }
    }
    
    var method: HTTPMethods {
        switch self {
        case .characters:
            return .get
        }
    }
    
    var requestParams: RequestParams {
        return .query(nil)
    }
}


