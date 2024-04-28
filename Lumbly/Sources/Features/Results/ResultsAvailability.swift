//
//  ResultsAvailability.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-28.
//

struct ResultsAvailability: Decodable {
    var status: AvailabilityStatus
    
    enum AvailabilityStatus: Int, Decodable {
        case unknown
        case loading
        case available
        case noResults
        case badVideo
        case error
    }
}
