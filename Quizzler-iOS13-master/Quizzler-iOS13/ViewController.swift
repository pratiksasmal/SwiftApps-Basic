import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        "4 + 2 = 6",
        "5 - 3 > 1",
        "3 + 8 < 10"
    ]   
    var quesNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func ansButtonPressed(_ sender: Any) {
        quesNum += 1
        updateUI()
    }
    func updateUI(){
        questionLabel.text = quiz[quesNum]
    }
}

