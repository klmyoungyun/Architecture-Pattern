//
//  UserListWireFrame.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import UIKit

class UserListWireFrame: UserListWireFrameProtocol {
    class func createUserListModule() -> UIViewController {
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "UserListNavigationController")
        guard let view = navigationController.children.first as? UserListView else { return UIViewController() }
        let presenter: UserListPresenterProtocol & UserListInteractorOutputProtocol = UserListPresenter()
        let interactor: UserListInteractor = UserListInteractor()
        let wireframe: UserListWireFrameProtocol = UserListWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        return navigationController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentUserDetail(from view: UserListViewProtocol, with user: User) {
        let userDetailViewController = UserDetailWireFrame.createUserListModule(with: user)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(userDetailViewController, animated: true)
        }
    }
}
