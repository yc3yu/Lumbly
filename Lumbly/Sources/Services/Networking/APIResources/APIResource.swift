//
//  APIResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-08.
//

protocol APIResource {
    associatedtype ModelType: Decodable

    var url: URL? { get set }
}

extension APIResource {
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { .convertFromSnakeCase }

    mutating func setURL(withString urlString: String?) {
        self.url = URL(string: urlString ?? "")
    }
}
