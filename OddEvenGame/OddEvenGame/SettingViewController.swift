//
//  SettingViewController.swift
//  OddEvenGame
//
//  Created by 김용재 on 2022/12/04.
//

import UIKit
protocol SettingDelegate{
    func getBallsCount(ballsCount: Int)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var ballsCountTextField: UITextField!
    
    var settingDelegate : SettingDelegate?
    var defaultBallsCount = 10
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 이전화면으로 돌아가기
    @IBAction func completeBtnPressed(_ sender: Any) {
        
        guard let ballsStr = self.ballsCountTextField.text, let balls = Int(ballsStr)  else {
            self.settingDelegate?.getBallsCount(ballsCount: self.defaultBallsCount)
            self.dismiss(animated: true)
            return
        }
        
        self.settingDelegate?.getBallsCount(ballsCount: balls)
        
        self.dismiss(animated: true)
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
