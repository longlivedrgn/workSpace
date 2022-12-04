//
//  InputViewController.swift
//  DelegatePatternProject
//
//  Created by 김용재 on 2022/12/04.
//

import UIKit

protocol UserInfoDelegate{
    func getUserInfo(name: String, age: String)
}

class InputViewController: UIViewController {
    
    @IBOutlet weak var userNametf: UITextField!
    @IBOutlet weak var userAgetf: UITextField!
    var delegate: UserInfoDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setUserInfo(_ sender: UIButton) {
        guard let userName = self.userNametf.text, let userAge = self.userAgetf.text else {
            print("사용자 정보가 없습니다.")
            return
        }
        
        self.delegate?.getUserInfo(name: userName, age: userAge)
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
