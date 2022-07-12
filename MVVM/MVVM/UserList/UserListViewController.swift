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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? ""
        if identifier == UserDetailViewController.identifier,
           let selectedUser = sender as? User,
           let userDetailVC = segue.destination as? UserDetailViewController {
            let userDetailViewModel = UserDetailViewModel(selectedUser)
            userDetailVC.viewModel = userDetailViewModel
        }
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
        
        // ACTION
        tableView.rx.modelSelected(User.self)
            .subscribe(onNext: { [weak self] selectedUser in
                self?.performSegue(withIdentifier: UserDetailViewController.identifier,
                                   sender: selectedUser)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: false)
            })
            .disposed(by: disposeBag)
        
        
    }
    
    // MARK: - InterfaceBuilder Links
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
}
