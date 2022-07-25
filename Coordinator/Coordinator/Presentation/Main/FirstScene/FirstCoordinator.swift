//
//  FirstCoordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

protocol FirstCoordinatorProtocol: Coordinator { }

class FirstCoordinator: FirstCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .first
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("FirstCoordinator init")
    }
    
    deinit {
        print("FirstCoordinator deinit")
    }
    
    func start() {
        let firstViewController = FirstViewController()
        firstViewController.delegate = self
        navigationController.pushViewController(firstViewController,
                                                animated: true)
    }
}

extension FirstCoordinator: FirstViewControllerDelegate {
    func firstViewController(_ didTapLogoutButton: UIButton) {
        self.finish()
    }
}
