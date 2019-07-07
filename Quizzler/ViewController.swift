//
//  ViewController.swift
//  Quizzler
//
//  Created by Shayan Momeni on 25/08/2015.
//

import UIKit


class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = QuestionBank()
    var pickAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickAnswer = true
        }
        else if sender.tag == 2 {
            pickAnswer = false
        }
        
        checkAnswer()
        
        questionNumber = questionNumber + 1
        
        nextQuestion()
        
    }
    
    
    func updateUI() {

        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
        progressLabel.text = String(questionNumber + 1) + "/13"
        
        scoreLabel.text = "Score: " + String(score)
    }
    

    func nextQuestion() {
        
        if questionNumber <= 12 {
            
            questionLabel.text = allQuestion.list[questionNumber].questionText
            
            updateUI()
        }
        else {
            
            let alert = UIAlertController(title: "Awsome", message: "You've finished all the questions , do you want to start over ?", preferredStyle: .alert)
            
            let restartAlert = UIAlertAction(title: "Restart", style: .default, handler:  { (UIAlertAction) in
                self.startOver()
            })
                alert.addAction(restartAlert)
            
                present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionNumber].answer
        
        if correctAnswer == pickAnswer {
            
            ProgressHUD.showSuccess("Correct")
            score = score + 1
        }
        else {
            
            ProgressHUD.showError("Wrong !!")
        }
        
    }
    
    
    func startOver() {
        
        score = 0
        questionNumber = 0
        nextQuestion()
    }
    
}
