//
//  ViewController.swift
//  SnapAttack
//
//  Created by Jisa Gigi on 10/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var firstCard: UIImageView!
    @IBOutlet weak var secondCard: UIImageView!
    @IBOutlet weak var startGame: UIButton!
    
    var scoreInt = 0
    var timeInt = 20
    var gameMode = 0
    
    var timer = Timer()
    var cardTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startGameAction(_ sender: Any) {
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            cardTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCards), userInfo: nil, repeats: true)
            startGame.isEnabled = false
            startGame.alpha = 0.25
            startGame.setTitle("Snap", for: .normal)
        }
        if gameMode == 1 {
            if firstCard.image == secondCard.image {
                scoreInt += 1
                scoreLabel.text = String("Score: \(scoreInt)")

            }else{
                scoreInt -= 1
                scoreLabel.text = String("Score: \(scoreInt)")

            }
            
        }
        if timeInt == 0 {
            scoreInt = 0
            timeInt = 20
            scoreLabel.text = String("Score: \(scoreInt)")
            timeLabel.text = String("Time: \(timeInt)")
            gameMode = 0
            startGame.setTitle("Start", for: .normal)
            firstCard.image = UIImage(named:"blue_cover")
            secondCard.image = UIImage(named:"blue_cover")

        }
    }
    @objc func updateTimer(){
        timeInt -= 1
        timeLabel.text = String("Time: \(timeInt)")
        gameMode = 1
        startGame.isEnabled = true
        startGame.alpha = 1
        if timeInt == 0 {
            timer.invalidate()
            cardTimer.invalidate()
            gameMode = 0
            startGame.setTitle("Restart", for: .normal)
        }
        
    }
    @objc func updateCards(){
        let cardList = ["ace_of_hearts","2_of_hearts",
                        "3_of_hearts","4_of_hearts",
                        "5_of_hearts","6_of_hearts",
                        "7_of_hearts","8_of_hearts",
                        "9_of_hearts","10_of_hearts"
                        ]/*,
                        
                        "ace_of_diamonds","2_of_diamonds",
                        "3_of_diamonds","4_of_diamonds",
                        "5_of_diamonds","6_of_diamonds",
                        "7_of_diamonds","8_of_diamonds",
                        "9_of_diamonds","10_of_diamonds",
                        "ace_of_spades","2_of_spades",
                        "3_of_spades","4_of_spades",
                        "5_of_spades","6_of_spades",
                        "7_of_spades","8_of_spades",
                        "9_of_spades","10_of_spades",
                        "ace_of_clubs","2_of_clubs",
                        "3_of_clubs","4_of_clubs",
                        "5_of_clubs","6_of_clubs",
                        "7_of_clubs","8_of_clubs",
                        "9_of_clubs","10_of_clubs",
                        "jack_of_clubs","jack_of_clubs2",
                        "jack_of_diamonds","jack_of_diamonds2",
                        "jack_of_spades","jack_of_spades2",
                        "jack_of_hearts","jack_of_hearts2",
                        "king_of_clubs","king_of_clubs2",
                        "king_of_diamonds","king_of_diamonds2",
                        "king_of_spades","king_of_spades2",
                        "king_of_hearts","king_of_hearts2",
                        "queen_of_clubs","queen_of_clubs2",
                        "queen_of_diamonds","queen_of_diamonds2",
                        "queen_of_spades","queen_of_spades2",
                        "queen_of_hearts","queen_of_hearts2"
        
        ]*/
        firstCard.image = UIImage(named: cardList.randomElement()!)
        secondCard.image = UIImage(named: cardList.randomElement()!)
    }
}

