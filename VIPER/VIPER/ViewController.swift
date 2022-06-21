//
//  ViewController.swift
//  VIPER
//
//  Created by 김영균 on 2022/06/21.
//

import UIKit

protocol LiveNewsListViewToPresenterProtocol {
    
}
// VIEW
class ViewController: UIViewController {
    var presenter: LiveNewsListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

