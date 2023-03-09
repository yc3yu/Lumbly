//
//  ExerciseTileViewController.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-02-19.
//

import SwiftUI

final class ExerciseTileViewController: UIHostingController<ExerciseTileView> {
    weak var coordinator: AppCoordinator?
    
    private var viewModel: ExerciseTileView.ExerciseTileViewModel?
}
