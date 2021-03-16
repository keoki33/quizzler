//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var choice2button: UIButton!
    @IBOutlet var choice3button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var choice1button: UIButton!
    
    var quizBrian = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrian.checkAnswer(userAnswer)
        
        if userGotItRight { sender.backgroundColor = UIColor.green } else { sender.backgroundColor = UIColor.red }

        quizBrian.nextQuestion()

        
        _ = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        questionLabel.text = quizBrian.getQuestionText()
        choice1button.setTitle(quizBrian.getAnswerText(number: 1), for: .normal)
        choice2button.setTitle(quizBrian.getAnswerText(number: 2), for: .normal)
        choice3button.setTitle(quizBrian.getAnswerText(number: 3), for: .normal)
        progressBar.progress = quizBrian.getProgress()
//        progressBar.progress = 1.0
        
        scoreLabel.text = "Score: \(quizBrian.getScore())"
        choice1button.backgroundColor = UIColor.clear
        choice2button.backgroundColor = UIColor.clear
        choice3button.backgroundColor = UIColor.clear
        print(quizBrian.getProgress())
    }
}
