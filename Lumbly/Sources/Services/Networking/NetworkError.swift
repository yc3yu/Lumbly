//
//  NetworkError.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-08.
//

import Foundation

enum NetworkError: Error {
    case malformedURL
    case invalidResponse(data: Data)
    
    enum HTTPError: Error {
        case badRequest
        case unauthorized
        case paymentRequired
        case forbidden
        case notFound
        case requestEntityTooLarge
        case unprocessableEntity
        case unknown(data: Data, response: URLResponse)
    }
}
