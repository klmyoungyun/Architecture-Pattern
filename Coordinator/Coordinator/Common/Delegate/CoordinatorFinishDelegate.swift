//
//  CoordinatorFinishDelegate.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import Foundation

// Delegate protocol helping parent Coordinator know when its child is ready to be finished.
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
