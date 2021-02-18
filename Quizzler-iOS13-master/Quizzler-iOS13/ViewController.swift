import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["4 + 2 = 6","True"],
        ["5 - 3 > 1","True"],
        ["3 + 8 < 10","False"]
    ]   
    var quesNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func ansButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[quesNum][1]
        
        if(userAnswer == actualAnswer){
            print("Right")
        }
        else {
            print("Wrong")
        }
        //to
        if quesNum + 1 < quiz.count{
            quesNum += 1
        }
// to make a loop of ques instead of stoppingafter last ques
        else {
            quesNum = 0
        }

        updateUI()
    }
    func updateUI(){
        questionLabel.text = quiz[quesNum][0]
    }
}

