//
//  CadastreMapView.swift
//  
//
//  Created by Petr Tomášek on 18.05.2022.
//

import SwiftUI
import MapKit

@available(iOS 14.0.0, *)
struct CadastreMapView: UIViewRepresentable {
    @StateObject var viewModel: CadastreMapViewModel
    private let mapView = MKMapView(frame: UIScreen.main.bounds)
    
    func makeUIView(context: Context) -> MKMapView {
        // TODO: compute the span from the boundary points
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: viewModel.midCoordinate, span: span)

        mapView.region = region
        mapView.delegate = context.coordinator
        mapView.addAnnotation(AddressAnnotation(coordinate: viewModel.midCoordinate, title: viewModel.address))
        mapView.addOverlay(MKPolygon(coordinates: viewModel.boundary, count: viewModel.boundary.count))

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    func makeCoordinator() -> CadastreMapViewCoordinator {
        CadastreMapViewCoordinator(self)
    }
}

@available(iOS 14.0.0, *)
struct CadastreMapView_Previews: PreviewProvider {
    static let coords = "49.300174 16.652054 49.300253 16.652179 49.300285 16.652132 49.300298 16.652148 49.300331 16.652175 49.300359 16.652187 49.300392 16.652191 49.300558 16.652106 49.3007 16.651975 49.300727 16.6519 49.30074 16.651882 49.300752 16.651869 49.30077 16.651876 49.300777 16.651867 49.300734 16.651794 49.300574 16.652007 49.300563 16.651989 49.300514 16.652055 49.300505 16.652067 49.300469 16.652006 49.30042 16.652071 49.300402 16.652037 49.30045 16.651974 49.300358 16.651809 49.300367 16.651797 49.30051 16.651607 49.300498 16.651586 49.300545 16.651523 49.300557 16.651544 49.300577 16.651517 49.300595 16.651548 49.300607 16.651534 49.300648 16.651608 49.300637 16.651624 49.300649 16.651646 49.300945 16.651249 49.300917 16.6512 49.301022 16.651062 49.301049 16.65111 49.301057 16.651101 49.301134 16.651236 49.301126 16.651247 49.301152 16.651294 49.301175 16.651269 49.301009 16.650977 49.300961 16.650981 49.300956 16.650992 49.300952 16.650994 49.300915 16.650999 49.300901 16.650984 49.300855 16.650914 49.300839 16.650887 49.300795 16.650819 49.300688 16.65098 49.300562 16.651166 49.300262 16.65161 49.30015 16.651775 49.29997 16.652041 49.300073 16.652203 49.300174 16.652054"
    static let midCoordinate = "49.300652 16.651267"
    
    static var previews: some View {
        CadastreMapView(viewModel: CadastreMapViewModel(address: "Adamov", boundaryPoints: coords, midCoordinate: midCoordinate))
    }
}
