//
//  Results.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

struct Results: Decodable {
    var exercises: [String]? // Array of available exercises to select in drop-down menu
    var selectedIndex: Int? // Index of selected element in array of exercises
    var problems: [Problem]?
    var summaryGraphTitle: String?
    var summaryGraphXLabel: String?
    var summaryGraphYLabel: String?
}

struct Problem: Decodable, Hashable {
    var icon: String?
    var name: String?
//        var problemDescription: String
//        var problemImage: Image
//        var solutionDescription: String
//        var solutionImage: Image
}
