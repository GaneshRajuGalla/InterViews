//
//  TargetType.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation

protocol TargetType{
    var baseUrl:String {get}
    var path:String{get}
    var method:HTTPMethods{get}
    var requestParams:RequestParams{ get}
}

extension TargetType{
    func asUrlRequest() throws -> URLRequest{
        
        let url = try baseUrl.asUrl()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HttpHeaderFields.contentType.rawValue)
        
        switch requestParams{
        case .query(let request):
            let params = try request?.toDictionary()
            let queryItems = params?.compactMap({URLQueryItem(name:$0.key, value: "\($0.value)")})
            var urlCompoenent = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            urlCompoenent?.queryItems = queryItems
            urlRequest.url = urlCompoenent?.url
            
        case .body(let request):
            let params = try request?.toDictionary()
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        return urlRequest
    }
}
