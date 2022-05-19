//
//  CadastralParcel.swift
//  
//
//  Created by Petr Tomášek on 18.05.2022.
//

import Foundation

struct CadastralParcel: Decodable, Equatable  {
    let areaValue: AreaValue
    let beginLifespanVersion: Date
    let endLifespanVersion: EndLifespanVersion
    let geometry: Geometry
    let inspireID: InspireID?
    let label, nationalCadastralReference: String
    let referencePoint: ReferencePoint
    let validFrom: EndLifespanVersion
}
