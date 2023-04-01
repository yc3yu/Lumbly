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
        private struct Constants {
            static let requestDelay: Double = 1.0
        }
        
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
            isLoading = true
            
            guard let timestamp = recordingViewModel.timestamp else {
                dataAvailability.status = .error
                isLoading = false
                return
            }
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ [weak self] currentTimer in
                if let parentExerciseSet = self?.recordingViewModel.parentExerciseSet,
                   let exerciseName = self?.recordingViewModel.exerciseName {
                    self?.apiHandler.fetchResultsDataAvailability(
                        parentExerciseSet: parentExerciseSet,
                        exerciseName: exerciseName,
                        timestamp: timestamp) { [weak self] dataAvailability in
                            self?.dataAvailability = dataAvailability
                        }
                }
                
                if self?.dataAvailability.status != .unavailable {
                    currentTimer.invalidate()
                }
            }
            
            guard dataAvailability.status == .available else {
                isLoading = false // TODO: Check if this is necessary (depends on implementation)
                return
            }
            
            apiHandler.fetchResultsData(parentExerciseSet: recordingViewModel.parentExerciseSet,
                                        exerciseName: recordingViewModel.exerciseName,
                                        timestamp: timestamp) { [weak self] results in
                self?.results = results
                self?.isLoading = false
            }
        }
    }
}
