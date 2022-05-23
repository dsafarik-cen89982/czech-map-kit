//
//  CadastreFetcher.swift
//  
//
//  Created by Petr Tomášek on 19.05.2022.
//

import Foundation
import CoreLocation

@available(iOS 10.0, *)
class CadastreFetcher: XMLFetcher {
    
    var urlComponents = URLComponents()

    override init() {
        super.init()
        
        decoder.shouldProcessNamespaces = true
        decoder.dateDecodingStrategy = .iso8601
        
        urlComponents.scheme = "https"
        urlComponents.host = "services.cuzk.cz"
        urlComponents.path = "/wfs/inspire-cp-wfs.asp"
        urlComponents.queryItems = [
            URLQueryItem(name: "service", value: "WFS"),
            URLQueryItem(name: "version", value: "2.0.0"),
            URLQueryItem(name: "request", value: "GetFeature"),
            URLQueryItem(name: "StoredQuery_id", value: "GetFeatureByPoint"),
            URLQueryItem(name: "srsName", value: "urn:ogc:def:crs:EPSG::4326")
        ]
    }
    
    @available(iOS 15.0.0, *)
    func fetchCadastralParcel(point: CLLocationCoordinate2D) async -> CadastralParcel? {
        let queryFeatureType = URLQueryItem(name: "FEATURE_TYPE", value: "CadastralParcel")
        let queryPoint = URLQueryItem(name: "POINT", value: "\(point.latitude),\(point.longitude)")
        
        urlComponents.queryItems?.append(contentsOf: [queryFeatureType, queryPoint])
        
        guard let url = urlComponents.url else {
            logger.error("Failed to parse a valid URL from the following URL components: \(urlComponents)")
            
            return nil
        }
        
        return await fetch(url: url)
    }
}
