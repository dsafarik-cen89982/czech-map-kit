//
//  CadastreMapViewModel.swift
//  
//
//  Created by Petr Tomášek on 19.05.2022.
//

import Foundation
import Combine
import CoreLocation

@available(iOS 13.0, *)
class CadastreMapViewModel: ObservableObject {
    @Published var address: String?
    @Published var boundary: [CLLocationCoordinate2D] = []
    @Published var midCoordinate = CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141) // London
    
    private var subscriptions = Set<AnyCancellable>()
    private let cadastreFetcher = CadastreFetcher()

    init(address: String, boundaryPoints: String, midCoordinate: String) {
        self.address = address

        boundaryPoints
            .split(separator: " ")
            .compactMap {
                Float($0)
            }
            .publisher
            .collect(2)
            .sink {
                self.boundary.append(CLLocationCoordinate2D(latitude: CLLocationDegrees($0[0]), longitude: CLLocationDegrees($0[1])))
            }
            .store(in: &subscriptions)
        
        let midCoordinateFloat = midCoordinate.split(separator: " ").compactMap {
            Float($0)
        }
        
        self.midCoordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(midCoordinateFloat[0]), longitude: CLLocationDegrees(midCoordinateFloat[1]))
            
    }
}
