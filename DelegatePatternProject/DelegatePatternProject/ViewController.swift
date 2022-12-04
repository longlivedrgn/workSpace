//
//  ViewController.swift
//  DelegatePatternProject
//
//  Created by 김용재 on 2022/12/04.
//

import UIKit

class ViewController: UIViewController, UserInfoDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBAction func btnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "InputViewController")
//        viewcontroller.delegate = self
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
    
    func getUserInfo(name: String, age: String) {
        print("userName \(name), userAge \(age)")
        self.userNameLbl.text = name
        self.userAgeLbl.text = age
    }
    
    @IBOutlet weak var userAgeLbl: UILabel!
}

