//
//  UserListWireFrame.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import UIKit

class UserListWireFrame: UserListWireFrameProtocol {
    class func createUserListModule(userListRef: UserListView) {
        let presenter: UserListPresenterProtocol & UserListOutputInteractorProtocol = UserListPresenter()
        
        userListRef.presenter = presenter
        userListRef.presenter?.view = userListRef
        userListRef.presenter?.interactor = UserListInteractor()
        userListRef.presenter?.interactor?.presenter = presenter
    }
}
