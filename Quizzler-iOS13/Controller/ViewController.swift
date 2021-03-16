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
    @IBOutlet var falseButton: UIButton!
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
        
        progressBar.progress = quizBrian.getProgress()
        scoreLabel.text = "Score: \(quizBrian.getScore())"
        choice2button.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
}
