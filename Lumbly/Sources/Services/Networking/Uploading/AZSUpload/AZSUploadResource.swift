//
//  AZSUploadResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-11.
//

import Foundation

struct AZSUploadResource {
    var containerName: String
    var uploadName: String
    var fileURL: URL
    
    init(containerName: String, uploadName: String, fileURL: URL) {
        self.containerName = containerName
        self.uploadName = uploadName
        self.fileURL = fileURL
    }
}
