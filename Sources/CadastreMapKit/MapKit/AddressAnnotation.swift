//
//  AddressAnnotation.swift
//  
//
//  Created by Petr Tomášek on 19.05.2022.
//

import MapKit

class AddressAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?) {
        self.coordinate = coordinate
        self.title = title
    }
}
