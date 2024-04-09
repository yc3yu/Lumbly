//
//  APIResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-08.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Decodable

    var url: URL? { get }
}

extension APIResource {
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { .convertFromSnakeCase }
}
