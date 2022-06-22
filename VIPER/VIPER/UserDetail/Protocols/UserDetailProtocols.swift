//
//  UserDetailProtocols.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/22.
//

import Foundation
import UIKit

protocol UserDetailPresenterProtocol: AnyObject {
    var view: UserDetailViewProtocol? { get set }
    var wireframe: UserDetailWireFrameProtocol? { get set }
    var user: User? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func didTapBackButton()
}

// PRESENTER -> VIEW
protocol UserDetailViewProtocol: AnyObject {
    func showUserDetail(with user: User)
}

protocol UserDetailWireFrameProtocol: AnyObject {
    static func createUserListModule(with user: User) -> UIViewController
    func goBackToUserListView(from view: UserDetailViewProtocol)
}
