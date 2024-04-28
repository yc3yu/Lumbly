//
//  ResultsViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2022-12-05.
//

import SwiftUI

extension ResultsView {
    class ResultsViewModel: ObservableObject {
        private struct Constants {
            static let requestDelay: Double = 1.0
            static let requestLeeway: DispatchTimeInterval = .milliseconds(50)
        }
        
        @Published private(set) var resultsData: Results? = nil
        @Published private(set) var isLoading: Bool = false
        @Published private(set) var resultsAvailability: ResultsAvailability = ResultsAvailability(status: .unknown)
        
        private var recordingViewModel: RecordingView.RecordingViewModel
        
        init(recordingViewModel: RecordingView.RecordingViewModel) {
            self.recordingViewModel = recordingViewModel
        }

        @MainActor func fetchResults() {
            guard let timestamp = recordingViewModel.timestamp else {
                resultsAvailability.status = .error
                return
            }
            
            defer { isLoading = false }
            isLoading = true
            resultsAvailability.status = .loading
            
            let parentExerciseSet = recordingViewModel.parentExerciseSet
            let exerciseName = recordingViewModel.exerciseName
            let timer = DispatchSource.makeTimerSource()
            timer.schedule(deadline: .now(), repeating: Constants.requestDelay, leeway: Constants.requestLeeway)
            timer.setEventHandler {
                Task {
                    await self.fetchResultsAvailability(parentExerciseSet: parentExerciseSet,
                                                        exerciseName: exerciseName,
                                                        timestamp: timestamp)
                    
                    if self.resultsAvailability.status == .available {
                        await self.fetchResultsData(parentExerciseSet: parentExerciseSet,
                                                    exerciseName: exerciseName,
                                                    timestamp: timestamp)
                    }
                    
                    if self.resultsAvailability.status != .loading {
                        timer.cancel()
                    }
                }
            }
            
            timer.activate()
        }
        
        private func fetchResultsAvailability(parentExerciseSet: String,
                                              exerciseName: String,
                                              timestamp: String) async {
            var resource = ResultsAvailabilityResource()
            resource.setURL(userID: APIEndpoints.userID,
                            parentExerciseSet: parentExerciseSet,
                            exerciseName: exerciseName,
                            timestamp: timestamp)
            
            let request = APIRequest(resource: resource)
            
            do {
                resultsAvailability = try await request.execute()
            } catch {
                resultsAvailability.status = .error
            }
        }
        
        private func fetchResultsData(parentExerciseSet: String,
                                      exerciseName: String,
                                      timestamp: String) async {
            var resource = ResultsResource()
            resource.setURL(userID: APIEndpoints.userID,
                            parentExerciseSet: parentExerciseSet,
                            timestamp: timestamp)
            
            let request = APIRequest(resource: resource)
            
            resultsData = try? await request.execute()
        }
    }
}
