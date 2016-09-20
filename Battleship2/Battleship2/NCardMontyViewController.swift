//
//  FirstViewController.swift
//  Battleship2
//
//  Created by Margaret Ikeda on 9/19/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//
//
//  NCardMontyViewController.swift
//  TabbedMonty
//
//  Created by The TEAM on 9/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//


import UIKit

class NCardMontyViewController: UIViewController {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var buttonContainer: UIView!
    
    let howManyCards: Int
    
    let brain: MontyBrain
    var loaded: Bool
//    let resetTitle = "Reset"
    
    //what is NSCoder?
    //archive structure
    //what does the line below mean/run?
    required init?(coder aDecoder: NSCoder) {
        self.howManyCards = 100
        self.loaded = false
        self.brain = MontyBrain(numCards: self.howManyCards)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //how does this work to setup the buttons?
    //buttonContainer is a subview
    //what is setNeedsDisplay?
    //Marks the specified rectangle of the receiver as needing to be redrawn.

    override func viewDidLayoutSubviews() {
        if !loaded {
            setUpGameButtons(v: buttonContainer, totalButtons: self.howManyCards, buttonsPerRow: 10)
            self.view.setNeedsDisplay()
        }
        loaded = true
    }
    
    func resetButtonColors() {
        for v in buttonContainer.subviews {
            if let button = v as? UIButton {
                button.backgroundColor = UIColor.blue
                button.isEnabled = true
            }
        }
    }
    
    func handleReset() {
        resetButtonColors()
        brain.setupCards()
    }
    //when are we disabling Card buttons? After winner is found
    func disableCardButtons() {
        for v in buttonContainer.subviews {
            if let button = v as? UIButton {
                button.isEnabled = false
            }
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        handleReset()
    }
    
    func buttonTapped(_ sender: UIButton) {
        gameLabel.text = sender.currentTitle
        
        if brain.checkCard(sender.tag - 1) {
            gameLabel.text = "Winner winner chicken dinner!"
            sender.backgroundColor = UIColor.green
            disableCardButtons()
            
            
        } else {
            gameLabel.text = "Nope! Guess again."
            sender.backgroundColor = UIColor.red
        }
    }
    //reset Button is a subview?
//    func setUpResetButton() {
//        let resetRect = CGRect(x: 10, y: 400, width: 60, height: 40)
//        let resetButton = UIButton(frame: resetRect)
//        resetButton.setTitle(resetTitle, for: UIControlState())
//        resetButton.backgroundColor = UIColor.darkGray
//        resetButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
//        view.addSubview(resetButton)
//    }
//    
    func setUpGameLabel () {
        gameLabel.text = "Let's Play!"
    }
    
 //this function takes three parameters. UIView, a number of total rows, and buttons per row to set up the grid.
    func setUpGameButtons(v: UIView, totalButtons: Int, buttonsPerRow : Int) {
        for i in 1...howManyCards {
            let y = ((i - 1) / buttonsPerRow)
            let x = ((i - 1) % buttonsPerRow)
            let side : CGFloat = v.bounds.size.width / CGFloat(buttonsPerRow)
            
            let rect = CGRect(origin: CGPoint(x: side * CGFloat(x), y: (CGFloat(y) * side)), size: CGSize(width: side - 1, height: side - 1))
            let button = UIButton(frame: rect)
            button.tag = i
            button.backgroundColor = UIColor.blue
            button.setTitle(String(i), for: UIControlState())
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            v.addSubview(button)
        }
        
        setUpGameLabel()
    }
}


