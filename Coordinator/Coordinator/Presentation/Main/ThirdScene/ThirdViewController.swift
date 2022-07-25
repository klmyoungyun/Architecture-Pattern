//
//  ThirdViewController.swift
//  Coordinator
//
//  Created by 김영균 on 2022/07/22.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        print("ThirdViewController DidLoad")
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("ThirdViewController deinit")
    }
}
