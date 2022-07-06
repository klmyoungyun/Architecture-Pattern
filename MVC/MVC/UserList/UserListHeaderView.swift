//
//  UserListHeaderView.swift
//  MVC
//
//  Created by 김영균 on 2022/07/06.
//

import UIKit

protocol UserListHeaderViewDelegate: AnyObject {
    func changeLabel(target: UILabel)
}
class UserListHeaderView: UIView {
    weak var delegate: UserListHeaderViewDelegate?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func didTapButton(_ sender: UIButton) {
        delegate?.changeLabel(target: label)
    }
}
