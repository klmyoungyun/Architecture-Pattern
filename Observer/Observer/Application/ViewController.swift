//
//  ViewController.swift
//  Observer
//
//  Created by 김영균 on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var stateLabel: UILabel!
  @IBOutlet weak var customer1MessageLabel: UILabel!
  @IBOutlet weak var customer2MessageLabel: UILabel!
  @IBOutlet weak var customer3MessageLabel: UILabel!
  
  private let appleStore = Store()
  private let customer1 = Customer(id: 1, name: "짱구")
  private let customer2 = Customer(id: 2, name: "유리")
  private let customer3 = Customer(id: 3, name: "맹구")
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func addCustomer1(_ sender: UIButton) {
    self.stateLabel.text = "아이폰 개수에 짱구 옵저버가 추가"
    self.appleStore.iPhoneCount.registerObserver(customer1) { count in
      self.customer1MessageLabel.text = "짱구에게 메세지: 아이폰 개수가 \(count)로 변화됨"
    }
  }
  
  @IBAction func addCustomer2(_ sender: UIButton) {
    self.stateLabel.text = "아이폰 개수에 유리 옵저버가 추가"
    self.appleStore.iPhoneCount.registerObserver(customer2) { count in
      self.customer2MessageLabel.text = "유리에게 메세지: 아이폰 개수가 \(count)로 변화됨"
    }
  }
  
  @IBAction func addCustomer3(_ sender: UIButton) {
    self.stateLabel.text = "아이폰 개수에 맹구 옵저버가 추가"
    self.appleStore.iPhoneCount.registerObserver(customer3) { count in
      self.customer3MessageLabel.text = "맹구에게 메세지: 아이폰 개수가 \(count)로 변화됨"
    }
  }
  
  @IBAction func addiPhone(_ sender: UIButton) {
    self.appleStore.addIphone()
    self.stateLabel.text = "아이폰 개수 증가"
  }
}

