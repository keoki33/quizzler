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
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!

    let quiz = [
        Question(text: "Four + two is qual to six.", answer: "True"),
        Question(text: "Five  - Three is greater than One", answer: "True"),
        Question(text: "Three + Eight is less than Ten", answer: "False")
    ]

    var questionNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        if userAnswer == actualAnswer { print("Right") } else { print("Wrong") }
        questionNumber = questionNumber == (quiz.count - 1) ? 0 : questionNumber + 1
        print(quiz.endIndex)
        updateUI()
    }

    func updateUI() {
        questionLabel.text = quiz[questionNumber].text
    }
}
