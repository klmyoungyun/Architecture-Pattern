//
//  SecondViewController.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        print("SecondViewController DidLoad")
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("SecondViewController deinit")
    }
}
