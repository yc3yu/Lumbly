//
//  AppCoordinator.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-10-26.
//

import UIKit

class AppCoordinator: Coordinator {

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ResultsViewController(rootView: ResultsView())
        
//    viewModel: ResultsViewModel(results: ResultsViewModel.Results(exercises: ["Bird dog", "Filler", "Example"],
//                                                                  selectedIndex: 0,
//                                                                  problems: [ResultsViewModel.Problem(icon: ResultsView_Previews.imageURL,
//                                                                                                      name: "Leg lifted too high"),
//                                                                             ResultsViewModel.Problem(icon: ResultsView_Previews.imageURL,
//                                                                                                      name: "A long problem string that flows to two lines"),
//                                                                             ResultsViewModel.Problem(icon: ResultsView_Previews.imageURL,
//                                                                                                      name: "A long problem string that flows to more than two lines of text"),
//                                                                             ResultsViewModel.Problem(icon: ResultsView_Previews.imageURL,
//                                                                                                      name: "Another problem"),
//                                                                             ResultsViewModel.Problem(icon: ResultsView_Previews.imageURL,
//                                                                                                      name: "One more problem")],
//                                                                  summaryGraphTitle: "AVERAGE FORM CORRECTNESS ")
        
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
