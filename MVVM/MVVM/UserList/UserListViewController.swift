//
//  UserListViewController.swift
//  MVVM
//
//  Created by 김영균 on 2022/07/10.
//

import UIKit

import RxCocoa
import RxSwift
import RxViewController

class UserListViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel: UserListViewModelType
    
    init(viewModel: UserListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.viewModel = UserListViewModel()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = UIRefreshControl()
        bind()
    }
    // MARK: - BIND
    func bind() {
        // INPUT
        let firstLoad = rx.viewWillAppear
            .take(1)
            .map { _ in () }
        let reload = tableView.refreshControl?.rx
            .controlEvent(.valueChanged)
            .map { _ in () } ?? Observable.just(())
        
        Observable.merge([firstLoad, reload])
            .bind(to: viewModel.fetchUsers)
            .disposed(by: disposeBag)
        
        // OUTPUT
        viewModel.allUsers
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) {
                (index, item, cell) in
                
                var content = cell.defaultContentConfiguration()
                content.text = item.name
                content.secondaryText = item.website
                cell.contentConfiguration = content
            }
            .disposed(by: disposeBag)
        
        viewModel.activated
            .observe(on: MainScheduler.instance)
            .map { !$0 }
            .do(onNext: { [weak self] isFinished in
                if isFinished {
                    self?.tableView.refreshControl?.endRefreshing()
                }
            })
            .bind(to: activityIndicator.rx.isHidden)
            .disposed(by: disposeBag)
    }
    // MARK: - InterfaceBuilder Links
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}

