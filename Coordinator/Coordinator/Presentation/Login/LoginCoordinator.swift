//
//  LoginCoordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

class LoginCoordinator: LoginCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .login
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        print("LoginCoordinator init")
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func start() {
        let loginViewController = LoginViewController()
        loginViewController.delegate = self
        navigationController.viewControllers = [loginViewController]
    }
    
    func showSignUpViewController() {
        //
    }
}
extension LoginCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        print(self.type,"이 finish")
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
extension LoginCoordinator: LoginViewControllerDelegate {
    func loginViewController(_ didTapLoginButton: UIButton) {
        self.finish()
    }
}
