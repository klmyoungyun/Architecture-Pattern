//
//  UserDetailWireFrame.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/22.
//

import Foundation
import UIKit

class UserDetailWireFrame: UserDetailWireFrameProtocol {
    
    class func createUserListModule(with user: User) -> UIViewController {
        let userDetailViewController = mainStoryboard.instantiateViewController(withIdentifier: "UserDetailController")
        guard let view = userDetailViewController as? UserDetailView else { return UIViewController() }
        
        let presenter: UserDetailPresenterProtocol = UserDetailPresenter()
        let wireframe: UserDetailWireFrameProtocol = UserDetailWireFrame()
        
        view.presenter = presenter
        presenter.view = view
        presenter.user = user
        presenter.wireframe = wireframe
        return userDetailViewController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func goBackToUserListView(from view: UserDetailViewProtocol) {
        guard let view = view as? UserDetailView else { return }
        view.navigationController?.popViewController(animated: true)
    }
}
