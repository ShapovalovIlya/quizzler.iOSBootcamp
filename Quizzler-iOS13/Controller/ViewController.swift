//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Updated by Ilia Shapovalov on 12/04/2022.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choise1: UIButton!
    @IBOutlet weak var choise2: UIButton!
    @IBOutlet weak var choise3: UIButton!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //Created constant that stores user's choise
        let userAnswer = sender.tag //True, False
        //Created constant that stores result of user's choise.
        let userGotRightAnswer = quizLogic.checkAnswer(userAnswer)
        
        if userGotRightAnswer {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        quizLogic.nextQuestion()
        
        //Creating delay between buttonPressed and updateUI.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        questionLabel.text = quizLogic.getQuestionText()
        progressBar.progress = quizLogic.getProgress()
        scoreLabel.text = "Score \(quizLogic.getScore())"
        
        choise1.backgroundColor = UIColor.clear
        choise2.backgroundColor = UIColor.clear
        choise3.backgroundColor = UIColor.clear
        
        choise1.setTitle(quizLogic.getAnswerText(for: choise1.tag), for: .normal)
        choise2.setTitle(quizLogic.getAnswerText(for: choise2.tag), for: .normal)
        choise3.setTitle(quizLogic.getAnswerText(for: choise3.tag), for: .normal)
    }
    
}

