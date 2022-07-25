//
//  ViewController.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/21.
//

import UIKit
import SnapKit
import Then

protocol LoginViewControllerDelegate: AnyObject {
    func loginViewController(_ didTapLoginButton: UIButton)
}
class LoginViewController: UIViewController {
    weak var delegate: LoginViewControllerDelegate?
    private lazy var loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.backgroundColor = .darkGray
        $0.addTarget(self,
                     action: #selector(didTapLoginButton),
                     for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login View Controller did Load")
        view.backgroundColor = .systemBackground
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    deinit {
        print("LoginViewController deinit")
    }
    
    @objc func didTapLoginButton() {
        print("login view controller : tap login button")
        self.delegate?.loginViewController(loginButton)
    }
}

