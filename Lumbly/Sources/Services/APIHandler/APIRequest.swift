//
//  APIRequest.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-08.
//

import Foundation

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
    
    func decode(data: Data) throws -> Resource.ModelType {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = resource.keyDecodingStrategy

        return try decoder.decode(Resource.ModelType.self, from: data)
    }
    
    func load(url: URL?) async throws -> Resource.ModelType {
        guard let url = url else {
            throw NetworkError.malformedURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try checkHTTPStatusCode(data: data, response: response)
        
        return try decode(data: data)
    }
    
    func execute() async throws -> Resource.ModelType {
        try await load(url: resource.url)
    }
}

private extension APIRequest {
    func checkHTTPStatusCode(data: Data, response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            return
        }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorized
        case 402:
            throw NetworkError.paymentRequired
        case 403:
            throw NetworkError.forbidden
        case 404:
            throw NetworkError.notFound
        case 413:
            throw NetworkError.requestEntityTooLarge
        case 422:
            throw NetworkError.unprocessableEntity
        default:
            throw NetworkError.unknown(data: data, response: httpResponse)
        }
    }
}
