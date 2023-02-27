//
//  ResultsViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

import SwiftUI

struct Results: Decodable {
    var exercises: [String]?
    var individualExerciseResults: [IndividualExerciseResults]?
    var wellDoneTiles: [FormCommentTile]?
}

struct IndividualExerciseResults: Decodable {
    var formMistakesTiles: [FormCommentTile]?
    var wellDoneTiles: [FormCommentTile]?
}

extension ResultsView {
    class ResultsViewModel: ObservableObject {
        private let apiHandler: APIHandler
        
        @Published private(set) var results: Results? = nil 
        
        init() {
            self.apiHandler = APIHandler()
            fetchData()
        }

        func fetchData() {
            apiHandler.fetchResultsData() { [weak self] results in
                self?.results = results
            }
        }
    }
}


