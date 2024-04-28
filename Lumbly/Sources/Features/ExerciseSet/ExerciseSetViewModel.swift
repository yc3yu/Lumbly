//
//  ExerciseSetViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

extension ExerciseSetView {
    class ExerciseSetViewModel: ObservableObject {
        @Published private(set) var exerciseSetData: ExerciseSet? = nil
        @Published var isLoading: Bool = false
        
        private var exerciseSetURL: String?
        
        init(exerciseSetURL: String?) {
            self.exerciseSetURL = exerciseSetURL
        }
        
        @MainActor func fetchExerciseSetData() async {
            guard !isLoading else { return }
            defer { isLoading = false }
            isLoading = true
            
            var resource = ExerciseSetResource()
            resource.setURL(withString: exerciseSetURL)
            
            let request = APIRequest(resource: resource)

            exerciseSetData = try? await request.execute()
        }
    }
}
