//
//  ConnectionStringResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-10.
//

struct ConnectionStringResource: APIResource {
    typealias ModelType = Data
    
    var url = APIEndpoints.connectionString.url
}
