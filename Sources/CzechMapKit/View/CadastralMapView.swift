//
//  CadastralMapView.swift
//  
//
//  Created by Petr Tomášek on 18.05.2022.
//

import SwiftUI
import MapKit
import Combine

@available(iOS 15.0.0, *)
public struct CadastralMapView: UIViewRepresentable {
    @ObservedObject var viewModel: CadastralMapViewModel
    private let mapView = MKMapView(frame: UIScreen.main.bounds)
    
    public init(midPoint: CLLocationCoordinate2D, address: String? = nil) {
        self.viewModel = CadastralMapViewModel(midPoint: midPoint, address: address)
    }
    
    public func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        
        addAnnotation()
        
        return mapView
    }

    public func updateUIView(_ uiView: MKMapView, context: Context) {
        mapView.removeOverlays(mapView.overlays)
        addOverlay()
    }
    
    public func makeCoordinator() -> CadastralMapViewCoordinator {
        CadastralMapViewCoordinator(self)
    }
    
    private func addOverlay() {
        mapView.addOverlay(MKPolygon(coordinates: $viewModel.boundary.wrappedValue, count: $viewModel.boundary.count))
    }
    
    private func addAnnotation() {
        // TODO: compute the span from the boundary points
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: viewModel.midPoint, span: span)

        mapView.region = region
        mapView.addAnnotation(AddressAnnotation(coordinate: viewModel.midPoint, title: viewModel.address))
    }
}

@available(iOS 15.0.0, *)
struct CadastreMapView_Previews: PreviewProvider {
    static var previews: some View {
        CadastralMapView(midPoint: CLLocationCoordinate2D(latitude: CLLocationDegrees(49.30068), longitude: CLLocationDegrees(16.651604)), address: "Adamov")
    }
}
