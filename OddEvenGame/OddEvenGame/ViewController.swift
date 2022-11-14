//
//  ViewController.swift
//  OddEvenGame
//
//  Created by 김용재 on 2022/11/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerBallCountLb1: UILabel!
    @IBOutlet weak var userBallCountLb1: UILabel!
    
    var comBallisCount: Int = 20
    var userBallisCount: Int = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLb1.text = String(comBallisCount)
        userBallCountLb1.text = String(userBallisCount)
    }

    @IBAction func gameStartPressed(_ sender: Any) {
        print("게임 시작!")
    }
    
}

