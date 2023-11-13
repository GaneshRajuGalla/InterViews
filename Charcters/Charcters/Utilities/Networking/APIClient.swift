//
//  APIClient.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation


class APIClient{
    
    static private var decoder:JSONDecoder{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    static private let successRange:Range = 200..<300
    
    static func sendRequest<T:Decodable>(endpoint:EndPointType) async throws -> T{
        let (data,response) = try await URLSession.shared.data(for: endpoint.asUrlRequest())
        let validData = try validatData(data: data, response: response)
        return try decoder.decode(T.self, from: validData)
    }
    
    static func validatData(data:Data,response:URLResponse) throws -> Data{
        guard let code = (response as? HTTPURLResponse)?.statusCode else {
            throw NSError(domain: "Invalid Response", code: 0)
        }
        
        if successRange.contains(code){
            return data
        }else{
            switch code{
            case 401:
                throw NSError(domain: "UnAuthorized", code: code)
            case 404:
                throw NSError(domain: "Route Not Found", code: code)
            default:
                throw NSError(domain: "Something Else", code: code)
            }
        }
    }
}
