//
//  ExerciseSetResource.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2024-04-09.
//

import Foundation

struct ExerciseSetResource: APIResource {
    typealias ModelType = ExerciseSet
    
    var url: URL?
    
    init(urlString: String) {
        self.url = URL(string: urlString)
    }
}
