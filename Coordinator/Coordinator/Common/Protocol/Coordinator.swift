//
//  Coordinator.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    var navigationController: UINavigationController { get set }
    
    // Array to keep tracking of all child coordinators.
    // Most of the time this array will contain only one child coordinator
    var childCoordinators: [Coordinator] { get set }
    
    // Define flow type
    var type: CoordinatorType { get }
    
    // Start logic
    func start()
    
    // Finish logic
    // 1. clean all children coordinators
    // 2. notify the parent that this coordinator is ready to be deallocated
    func finish()
    
    init(_ navigationController: UINavigationController)
}

extension Coordinator {
    func finish() {
        print(self.type,"이 finish")
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}
