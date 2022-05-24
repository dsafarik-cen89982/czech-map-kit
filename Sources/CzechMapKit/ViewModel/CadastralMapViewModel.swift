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
    @Published var boundary: [CLLocationCoordinate2D] = []

    var address: String?
    var midPoint: CLLocationCoordinate2D
    let cadastreFetcher = CadastreFetcher()

    private var subscriptions = Set<AnyCancellable>()
    
    init(midPoint: CLLocationCoordinate2D, address: String? = nil) {
        self.midPoint = midPoint
        self.address = address
        fetchBoundary(midPoint: midPoint)
    }
    
    func fetchBoundary(midPoint: CLLocationCoordinate2D) {
        Task.init {
            let cadastralParcel = await cadastreFetcher.fetchCadastralParcel(point: midPoint)
            cadastralParcel?.geometry.Polygon.exterior?.LinearRing.posList
                .split(separator: " ")
                .compactMap {
                    Float($0)
                }
                .publisher
                .collect(2)
                .receive(on: DispatchQueue.main)
                .map {
                    CLLocationCoordinate2D(latitude: CLLocationDegrees($0[0]), longitude: CLLocationDegrees($0[1]))
                }
                .collect()
                .sink {
                    self.boundary = $0
                }
                .store(in: &subscriptions)
        }
    }
}
