//
//  TabBarCoordinatorProtocol.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    func selectPage(_ page: TabBarPage)
    func setSelectedIndex(_ index: Int)
    func currentPage() -> TabBarPage?
}
