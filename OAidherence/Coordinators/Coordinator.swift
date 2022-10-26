//
//  Coordinator.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-10-26.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
