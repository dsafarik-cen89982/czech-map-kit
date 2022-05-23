//
//  File.swift
//  
//
//  Created by Petr Tomášek on 19.05.2022.
//

import Foundation

@available(iOS 15.0.0, *)
protocol Fetcher {
    func fetch<T: Decodable>(url: URL) async -> T?
}
