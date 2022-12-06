//
//  ResultsViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

import SwiftUI

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


