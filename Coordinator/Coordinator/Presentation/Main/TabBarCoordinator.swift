//
//  TabBarCoordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

class TabBarCoordinator: TabBarCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .tab
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
        print("TabBarCoordinator init")
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    func start() {
        let pages: [TabBarPage] = TabBarPage.allCases
        let controllers: [UINavigationController] = pages.map({
            configureTabNavigationController(of: $0)
        })
        configureTabBarController(withTabControllers: controllers)
    }
    
    private func configureTabBarController(withTabControllers tabControllers: [UIViewController]) {
        self.tabBarController.setViewControllers(tabControllers, animated: true)
        self.tabBarController.selectedIndex = TabBarPage.first.pageOrderNumber()
        self.tabBarController.view.backgroundColor = .systemBackground
        self.tabBarController.tabBar.backgroundColor = .systemBackground
        self.tabBarController.tabBar.tintColor = .black
        
        self.navigationController.pushViewController(self.tabBarController, animated: true)
    }
    
    private func configureTabBarItem(of page: TabBarPage) -> UITabBarItem {
        return UITabBarItem(title: page.pageTitleValue(),
                            image: nil,
                            tag: page.pageOrderNumber())
    }
    
    private func configureTabNavigationController(of page: TabBarPage) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        tabNavigationController.setNavigationBarHidden(false, animated: false)
        tabNavigationController.tabBarItem = self.configureTabBarItem(of: page)
        self.startTabCoordinator(of: page, to: tabNavigationController)
        return tabNavigationController
    }
    
    private func startTabCoordinator(of page: TabBarPage, to tabNavigationController: UINavigationController) {
        switch page {
        case .first:
            let firstCoordinator = FirstCoordinator(tabNavigationController)
            firstCoordinator.finishDelegate = self
            self.childCoordinators.append(firstCoordinator)
            firstCoordinator.start()
        case .second:
            let secondCoordinator = SecondCoordinator(tabNavigationController)
            secondCoordinator.finishDelegate = self
            self.childCoordinators.append(secondCoordinator)
            secondCoordinator.start()
        case .third:
            let thirdCoordinator = ThirdCoordinator(tabNavigationController)
            thirdCoordinator.finishDelegate = self
            self.childCoordinators.append(thirdCoordinator)
            thirdCoordinator.start()
        }
    }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func setSelectedIndex(_ index: Int) {
        guard let page = TabBarPage(index: index) else { return }
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    func currentPage() -> TabBarPage? {
        TabBarPage(index: self.tabBarController.selectedIndex)
    }
}

extension TabBarCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        print(self.type,"이 finish")
        self.childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        if childCoordinator.type == .first {
            navigationController.viewControllers.removeAll()
            finishDelegate?.coordinatorDidFinish(childCoordinator: self)
        }
    }
}
