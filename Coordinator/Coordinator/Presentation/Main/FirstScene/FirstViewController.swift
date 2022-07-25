//
//  FirstViewController.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit
import SnapKit
import Then

protocol FirstViewControllerDelegate: AnyObject {
    func firstViewController(_ didTapLogoutButton: UIButton)
}

class FirstViewController: UIViewController {
    weak var delegate: FirstViewControllerDelegate?
    
    private lazy var logoutButton = UIButton().then {
        $0.setTitle("로그아웃하기", for: .normal)
        $0.backgroundColor = .darkGray
        $0.addTarget(self,
                     action: #selector(didTapLogoutButton),
                     for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print("FirstViewController DidLoad")
        // Do any additional setup after loading the view.
        view.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    deinit {
        print("FirstViewController deinit")
    }
    
    @objc func didTapLogoutButton() {
        self.delegate?.firstViewController(logoutButton)
    }
}

