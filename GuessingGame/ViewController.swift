//
//  ViewController.swift
//  GuessingGame
//
//  Created by Andrei Cirlan on 12/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["Estonia","France","Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionsAsked += 1
        
        button1.setImage((UIImage(named: countries[0])), for: .normal)
        button2.setImage((UIImage(named: countries[1])), for: .normal)
        button3.setImage((UIImage(named: countries[2])), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())        Total score is:  \(score)"
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong.You choose \(countries[sender.tag]). The correct answer is \(correctAnswer+1) (first/second/third) flag"
            
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        if(questionsAsked == 10) {
            ac.title = "GAME OVER"
            ac.message = "Your final score is \(score)"
            ac.addAction(UIAlertAction(title: "Stop", style: .default))
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        
        present(ac, animated: true)
    }
}

