//
//  Identifier.swift
//  
//
//  Created by Petr Tomášek on 18.05.2022.
//

import Foundation

struct Identifier: Decodable, Equatable  {
    let localID, namespace: String
}
