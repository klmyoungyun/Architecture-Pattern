//
//  ThirdCoordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

protocol ThirdCoordinatorProtocol: Coordinator { }

class ThirdCoordinator: ThirdCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .third
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("ThirdCoordinator init")
    }
    
    deinit {
        print("ThirdCoordinator deinit")
    }
    
    func start() {
        let thirdViewController = ThirdViewController()
        navigationController.pushViewController(thirdViewController,
                                                animated: true)
    }
}
