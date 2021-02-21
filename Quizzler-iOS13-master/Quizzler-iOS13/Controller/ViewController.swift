import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
   /* let quiz = [
        ["A slug's blood is green.","True"]
    
    ]*/
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func ansButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        //quizBrain.checkAnswer(userAnswer)
        //let actualAnswer = quiz[quesNum][1]
        
        if userGotItRight {
        //if quizBrain.checkAnswer(sender.currentTitle!){
            //print("Right")
            sender.backgroundColor = UIColor.green
        }
        else {
            //print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()

        updateUI()
    }
 @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        //questionLabel.text = quiz[quesNum][0]
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
    }
}

