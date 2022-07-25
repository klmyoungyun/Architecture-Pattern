//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .app
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: true)
        print("Appcoordinator init")
    }
    
    deinit {
        print("Appcoordinator deInit")
    }
    
    func start() {
        // if isLoggedIn is false
        showLoginFlow()
        // else
        // showTabBarFlow()
    }
    
    func showLoginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController)
        loginCoordinator.finishDelegate = self
        loginCoordinator.start()
        childCoordinators.append(loginCoordinator)
    }
    
    func showTabBarFlow() {
        let tabCoordinator = TabBarCoordinator(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        print(self.type,"이 finish")
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        navigationController.viewControllers.removeAll()
        switch childCoordinator.type {
        case .login:
            showTabBarFlow()
        case .tab:
            showLoginFlow()
        default:
            break
        }
    }
}
