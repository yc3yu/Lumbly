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
        let vc = ResultsViewController(rootView: ResultsView(viewModel: .init(exercises: ["Bird dog", "Filler", "Example"],
                                                                              selectedIndex: 0,
                                                                              summaryGraphTitle: "AVERAGE FORM CORRECTNESS "),
                                                             exerciseMenuSelection: { }))
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
