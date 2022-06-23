//
//  UserListProtocols.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import Foundation
import UIKit

protocol UserListPresenterProtocol: AnyObject {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorInputProtocol? { get set }
    var wireframe: UserListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showUserDetail(forUser user: User)
}

protocol UserListViewProtocol: AnyObject {
    // PRESNETER -> VIEW
    func showUsers(with users: [User])
}

// Presenter: Interactor야 데이터 내놔
protocol UserListInteractorInputProtocol: AnyObject {
    var presenter: UserListInteractorOutputProtocol? { get set }
    var service: UserListServiceInputProtocol? { get set }
    // Presenter -> Interactor
    func fetchUserList()
}

protocol UserListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func didFetchUserList(_ userList: [User])
    func onError()
}

protocol UserListWireFrameProtocol: AnyObject {
    static func createUserListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentUserDetail(from view: UserListViewProtocol, with user: User)
}

protocol UserListServiceInputProtocol: AnyObject {
    var interactor: UserListServiceOutputProtocol? { get set }
    // INTERACTOR -> SERVICE
    func fetchUserList()
}

protocol UserListServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
    func onUserListFetched(_ users: [User])
    func onError()
}
