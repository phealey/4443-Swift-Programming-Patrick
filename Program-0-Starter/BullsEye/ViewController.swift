//
//  ViewController.swift
//  BullsEye
//
//  Created by M.I. Hollemans on 10/09/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var round = 0
    var currentValue = 50
    var targetValue = 0
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = 1 + Int(arc4random_uniform(100))
        startNewGame()
        updateLabels()
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }
      @IBAction func showAlert() {
      let difference = abs(targetValue - currentValue)
      var points = 100 - difference
      score += points
    
      var title : String?
      if difference == 0 {
        title = "Perfect!"
        points += 100
      } else if difference < 5 {
        title = "You almost had it!"
        if difference == 1{
          points += 50
        }
      } else if difference < 10 {
        title = "Pretty good!"
      } else {
        title = "Not even close..."
      }
      let message = "You scored \(points) points"
      let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
      let action = UIAlertAction(title: "Okay", style: .Default, handler: { action in
        self.startNewRound()
        self.updateLabels()
        })
      alert.addAction(action)
      presentViewController(alert, animated: true, completion: nil)
      startNewRound()
      updateLabels()
      
  }
  @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
  }
  @IBAction func startOver() {
        startNewGame()
        updateLabels()
  }
  func startNewRound(){
    round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
  }
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  func startNewGame() {
      score = 0
      round = 0
      startNewRound()
  }
  
}