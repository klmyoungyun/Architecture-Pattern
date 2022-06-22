//
//  UserDetailView.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/22.
//

import UIKit

class UserDetailView: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var presenter: UserDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        presenter?.didTapBackButton()
    }
}

extension UserDetailView: UserDetailViewProtocol {
    func showUserDetail(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        phoneLabel.text = user.phone
    }
}
