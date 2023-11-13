//
//  String.swift
//  Charcters
//
//  Created by Ganesh on 09/11/23.
//

import Foundation

extension String{
    func asUrl() throws -> URL{
        guard let url = URL(string: self) else{
            throw CustomError.inValidUrl
        }
        return url
    }
}

enum CustomError:Error{
    case inValidUrl
}
