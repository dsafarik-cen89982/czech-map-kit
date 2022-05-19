//
//  CadastreMapViewCoordinator.swift
//  
//
//  Created by Petr Tomášek on 19.05.2022.
//

import MapKit

@available(iOS 14.0.0, *)
class CadastreMapViewCoordinator: NSObject, MKMapViewDelegate {
    var parent: CadastreMapView

    init(_ parent: CadastreMapView) {
        self.parent = parent
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let polygonView = MKPolygonRenderer(overlay: overlay)
        polygonView.strokeColor = UIColor(cgColor: CGColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1))
        polygonView.lineWidth = 2
        polygonView.fillColor = UIColor(cgColor: CGColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1))
        polygonView.alpha = 0.9
        return polygonView
    }
}
