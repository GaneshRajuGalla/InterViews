//
//  Enums.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation

enum HttpHeaderFields:String{
    case contentType = "Content-Type"
}

enum HTTPMethods:String{
    case get = "GET"
}

enum ContentType:String{
    case json = "Application/json"
}

enum RequestParams{
    case query(_ request: Encodable?)
    case body(_ request: Encodable?)
}
