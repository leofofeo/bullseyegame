//
//  ViewController.swift
//  BullsEye
//
//  Created by Leonardo Rubiano on 14.09.18.
//  Copyright © 2018 leofofeo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreLabel.text = String(0)
        roundLabel.text = String(1)
        
        actionButton.layer.cornerRadius = 30
        actionButton.clipsToBounds = true
        
        restartButton.layer.cornerRadius = 10
        restartButton.clipsToBounds = true
        
        startNewRound()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let points = calculateRoundPoints()
        score += points
        let alertTitle = calculateAlertTitle(points)
        let message = "The value of the slider is: \(currentValue)" + " \nThe target value is: \(targetValue)" + "\nYou scored: \(points) points"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.startNewRound()})

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func restartGame() {
        score = 0
        round = 0
        updateScoreLabel()
        updateRoundLabel()
        startNewRound()
    }
    
    func setTargetScoreLabel() {
        targetScoreLabel.text = String(targetValue)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        round += 1
        setTargetScoreLabel()
        updateRoundLabel()
        updateScoreLabel()
    }
    
    func calculateRoundPoints() -> Int {
        let difference: Int = abs(currentValue - targetValue)
        let points: Int
        if difference == 0 {
            points = 200
        } else {
            points = 100 - difference
        }
        
        return points
    }
    
    func updateScoreLabel() {
        scoreLabel.text = String(score)
    }
    
    func updateRoundLabel() {
        roundLabel.text = String(round)
    }
    
    func calculateAlertTitle(_ points: Int) -> String {
        let alertTitle : String
        
        switch points {
        case 100...:
            alertTitle = "Perfect!"
        case 95...99:
            alertTitle = "Almost!"
        case 90...94:
            alertTitle = "Pretty good"
        case 85...89:
            alertTitle = "Not bad!"
        default:
            alertTitle = "Try again."
        }
        
        return alertTitle
    }
    
}

