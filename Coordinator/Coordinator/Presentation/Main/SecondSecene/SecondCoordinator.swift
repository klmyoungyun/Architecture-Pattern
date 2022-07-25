//
//  SecondCoordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

protocol SecondCoordinatorProtocol: Coordinator { }

class SecondCoordinator: SecondCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .second

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("SecondCoordinator init")
    }
    
    deinit {
        print("SecondCoordinator deinit")
    }
    
    func start() {
        let secondViewController = SecondViewController()
        navigationController.pushViewController(secondViewController,
                                                animated: true)
    }
}
