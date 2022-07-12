//
//  UserDetailViewController.swift
//  MVVM
//
//  Created by 김영균 on 2022/07/10.
//

import UIKit
import RxSwift

class UserDetailViewController: UIViewController {
    static let identifier = "UserDetailViewController"
    
    private let disposeBag = DisposeBag()
    var viewModel: UserDetailViewModelType
    
    init(viewModel: UserDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.viewModel = UserDetailViewModel()
        super.init(coder: coder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    // MARK: - BIND
    func bind() {
        //  NAVIGATION
        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        // OUTPUT
        viewModel.nameText
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.phoneText
            .bind(to: phoneLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.emailText
            .bind(to: emailLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    // MARK: - InterfaceBuilder Links
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
}
