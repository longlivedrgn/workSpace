//
//  ViewController.swift
//  OddEvenGame
//
//  Created by 김용재 on 2022/11/14.
//
/*
 1. 컴퓨터가 1에서 10까지의 랜덤으로 숫자를 선택합니다.
 2. 사용자는 가진 구슬 개수를 걸고 홀짝 중의 하나를 선택한다.
 3. 결과값이 화면에 보여진다.
 
 // 컴터랑 나랑 같은 거면 내가 이긴다!
 */
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fistImage: UIImageView!
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var resultLb1: UILabel!
    @IBOutlet weak var computerBallCountLb1: UILabel!
    @IBOutlet weak var userBallCountLb1: UILabel!
    
    var comBallisCount: Int = 20
    var userBallisCount: Int = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        computerBallCountLb1.text = String(comBallisCount)
        userBallCountLb1.text = String(userBallisCount)
        // 처음 시작될 때는 fistImage가 보이지 않게 해놓는다.
        self.imageContainer.isHidden = true
        }

    @IBAction func gameStartPressed(_ sender: Any) {
        
        self.imageContainer.isHidden = false
        // 애니메이션 !
        UIView.animate(withDuration: 3.0) {
            self.fistImage.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.fistImage.transform = CGAffineTransform(scaleX: 1, y: 1)
        } completion: { _ in
            self.imageContainer.isHidden = true
            self.showAlert()
        }

    }
    
    
    func showAlert(){
        
        // alert -> 화면 중앙, actionsheet -> 화면 하단
        let alert = UIAlertController.init(title: "GAME START", message: "홀 짝을 선택해주세요", preferredStyle: .alert)
        
        let oddBtn = UIAlertAction(title: "홀", style: .default){ _ in
            print("홀버튼을 클릭했습니다.")
            // first -> 첫번째 textfield를 말하는 것이다.
//            print(alert.textFields?.first?.text)
            guard let input = alert.textFields?.first?.text, let value = Int(input) else {
                return
            }
            
            if value > self.userBallisCount {
                let alertview = UIAlertController.init(title: "안됩니다", message: "베팅값이 너무 큽니다", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "다시하시겠습니까?", style: .default){_ in
                    self.showAlert()
                }
                alertview.addAction(okBtn)
                self.present(alertview, animated: true)
                return
            }
                
            print("입력한 값은 \(input)입니다.")
            self.getWinner(count: value, select: "홀")
        }
        
        let evenBtn = UIAlertAction(title: "짝", style: .default){ _ in
            print("짝버튼을 클릭했습니다.")

            guard let input = alert.textFields?[0].text else {
                return
            }
            
            guard let value = Int(input) else {
                return
            }
            
            if value > self.userBallisCount {
                let alertview = UIAlertController.init(title: "안됩니다", message: "베팅값이 너무 큽니다", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "다시하시겠습니까?", style: .default){_ in
                    self.showAlert()
                }
                alertview.addAction(okBtn)
                self.present(alertview, animated: true)
                return
            }

            self.getWinner(count: value, select: "짝")

        }

        alert.addTextField{ textfield in
            textfield.placeholder = "베팅할 구슬의 개수를 입력해주세요."
        }

        alert.addAction(oddBtn)
        alert.addAction(evenBtn)

        self.present(alert, animated: true){
            print("화면이 띄어졌습니다.")
        }
    }
    
    func getWinner(count: Int, select: String){
        let com = self.getRandom()
        let comType = com % 2 == 0 ? "짝" : "홀"
        var result = comType
        
        if comType == select {
            print("User win")
            result = result + "(User Win)"
            self.resultLb1.text = result
            self.calculateBalls(winner: "user", count: count)
        } else {
            result = result + "(Com Win)"
            print("Computer win")
            self.resultLb1.text = result
            self.calculateBalls(winner: "com", count: count)
        }
    }
    
    func checkAccountEmpty(balls: Int) -> Bool {
        return balls == 0
    }
    
    func calculateBalls(winner: String, count: Int){
        if winner == "com" {
            self.userBallisCount = self.userBallisCount - count
            self.comBallisCount = self.comBallisCount + count
            
            if self.checkAccountEmpty(balls: self.userBallisCount) {
                self.resultLb1.text = "컴퓨터 최종승리"
            }
        } else {
            self.comBallisCount = self.comBallisCount - count
            self.userBallisCount = self.userBallisCount + count
            
            if self.checkAccountEmpty(balls: self.comBallisCount){
                self.resultLb1.text = "사용자 최종승리"
            }
        }
        self.userBallCountLb1.text = "\(self.userBallisCount)"
        self.computerBallCountLb1.text = "\(self.comBallisCount)"
    }
    
    // 컴퓨터 값 -> 랜덤값 1~10 사이의 값
    func getRandom() -> Int {
        return Int(arc4random_uniform(10) + 1)
    }
    
}


// 0 이하이면 값을 0으로 받고 -> 완전 멈추기
