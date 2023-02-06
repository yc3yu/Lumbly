//
//  ResultsViewController.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-11-29.
//

import SwiftUI

final class ResultsViewController: UIHostingController<ResultsView> {
    weak var coordinator: AppCoordinator?
    
    private var viewModel: ResultsView.ResultsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewModel()
    }
    
    func updateViewModel() {
        self.viewModel = ResultsView.ResultsViewModel()
    }
}

