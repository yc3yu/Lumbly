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
        let vc = ResultsViewController(rootView: ResultsView(viewModel: .init(name: "Anne")))
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
