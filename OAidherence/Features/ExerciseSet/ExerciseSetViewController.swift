//
//  ExerciseSetViewController.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-20.
//

import SwiftUI

final class ExerciseSetViewController: UIHostingController<ExerciseSetView> {
    weak var coordinator: AppCoordinator?
    
    private var viewModel: ExerciseSetView.ExerciseSetViewModel?
}
