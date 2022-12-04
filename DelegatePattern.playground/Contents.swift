import UIKit

var greeting = "Hello, playground"

protocol HomeDelegate{
    func solveMathProblems()
        
}


class Me: HomeDelegate {
    func solveMathProblems() {
        print("숙제가 완료되었습니다.")
    }
    
    var harry = MathMaster()
    
    func askForHelp(){
        self.harry.delegate = self
        self.harry.didHomework()
    }
}

class MathMaster {
    
    var delegate: HomeDelegate?
    
    func didHomework(){
        self.delegate?.solveMathProblems()
    }
}

var atlas = Me()
atlas.askForHelp()
