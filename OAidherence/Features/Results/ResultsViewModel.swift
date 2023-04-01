//
//  ResultsViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

import SwiftUI

struct ResultsAvailability: Decodable {
    var status: AvailabilityStatus
    
    enum AvailabilityStatus: Decodable {
        case available
        case unavailable
        case error
    }
}

struct Results: Decodable {
    var exercises: [String]?
    var individualExerciseResults: [IndividualExerciseResults?]?
}

struct IndividualExerciseResults: Decodable {
    var formMistakesTiles: [FormCommentTile]?
    var wellDoneTiles: [FormCommentTile]?
}

extension ResultsView {
    class ResultsViewModel: ObservableObject {
        private let apiHandler: APIHandler
        private var recordingViewModel: RecordingView.RecordingViewModel
        
        @Published private(set) var results: Results? = nil
        @Published var isLoading: Bool = false
        @Published var dataAvailability: ResultsAvailability = ResultsAvailability(status: .unavailable)
        
        init(recordingViewModel: RecordingView.RecordingViewModel) {
            self.apiHandler = APIHandler()
            self.recordingViewModel = recordingViewModel
            fetchData()
        }

        func fetchData() {
            apiHandler.fetchResultsData() { [weak self] results in
                self?.results = results
            }
        }
    }
}
