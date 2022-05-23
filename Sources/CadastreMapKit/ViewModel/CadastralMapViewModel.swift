//
//  CadastralMapViewModel.swift
//  
//
//  Created by Petr Tomášek on 19.05.2022.
//

import Foundation
import Combine
import CoreLocation

@available(iOS 15.0, *)
class CadastralMapViewModel: ObservableObject {
    @Published var address: String?
    @Published var boundary: [CLLocationCoordinate2D] = []
    
    @Published var midPoint: CLLocationCoordinate2D {
        didSet {
            Task.init {
                let cadastralParcel = await cadastreFetcher.fetchCadastralParcel(point: midPoint)
                cadastralParcel?.geometry.Polygon.exterior?.LinearRing.posList
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
            }
        }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    let cadastreFetcher = CadastreFetcher()
    
    init(midPoint: CLLocationCoordinate2D) {
        self.midPoint = midPoint
    }
}
