//
//  XMLFetcher.swift
//  
//
//  Created by Petr Tomášek on 16.05.2022.
//

import Foundation
import XMLCoder
import Logging

@available(iOS 10.0, *)
class XMLFetcher: Fetcher {
    let decoder: XMLDecoder
    let logger: Logger
    
    init() {
        decoder = XMLDecoder()
        logger = Logger(label: "cz.csas.moba.CzechMapKit.XMLFetcher.main")
    }
    
    @available(iOS 15.0.0, *)
    func fetch<T: Decodable>(url: URL) async -> T? {
        do {
            let data = try await URLSession.shared.data(from: url)
            let response = try decoder.decode(T.self, from: data.0)
            
            return response
        } catch {
            logger.error("Failed to decode XML from URL \(url) due to \(error)")
            
            return nil
        }
    }
}
