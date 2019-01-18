//
//  ViewController.swift
//  GUpDown
//
//  Created by 정건휘 on 18/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: IBOutlets
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var upDownLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    var randomNumber: UInt32 = 0
    var countNumber: Int = 0
    
    // MARK: IBActions
    @IBAction func submitButton(_ sender: UIButton) {
        guard let inputText = self.inputField.text,
            inputText.isEmpty == false else {
                return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            return
        }
        
        countNumber += 1
        self.countLabel.text = "\(countNumber) / 5 (최대 5번)"
        
        if inputNumber > 25 {
            let alert = UIAlertController(title: nil, message: "최대값 : 25", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
            
        } else if inputNumber > randomNumber {
            self.upDownLabel.text = "UP!"
        } else if inputNumber < randomNumber {
            self.upDownLabel.text = "Down!"
        } else {
            self.upDownLabel.text = "정답!"
            self.submitBtn.isEnabled = false
        }
        
        if countNumber > 4 {
            self.upDownLabel.text = "END (정답은 : \(randomNumber))"
            self.submitBtn.isEnabled = false
        }
        
        
        
    }
    @IBAction func resetButton(_ sender: UIButton) {
        self.initializeGame()
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeGame()
        
    }
    
    // MARK: Custom Methods
    func initializeGame() {
        self.randomNumber = arc4random() % 25
        self.countNumber = 0
        
        self.upDownLabel.text = "Start!"
        self.countLabel.text = "\(self.countNumber)"
        
        self.inputField.text = nil
        self.submitBtn.isEnabled = true
    }
    
}




/*
 
 // MARK: - Properties
 // MARK: IBOutlets
 @IBOutlet var resultLabel: UILabel!
 @IBOutlet var turnCountLabel: UILabel!
 @IBOutlet var inputField: UITextField!
 
 // MARK: Stored Properties
 var randomNumber: UInt32 = 0
 var turnCount: Int = 0
 
 
 // MARK: - Methods
 @IBAction func touchUpSubmitButton(_ sender: UIButton) {
 guard let inputText = self.inputField.text,
 inputText.isEmpty == false else {
 return
 }
 
 guard let inputNumber: UInt32 = UInt32(inputText) else {
 return
 }
 
 turnCount += 1
 self.turnCountLabel.text = "\(turnCount) 번째"
 
 if inputNumber > randomNumber {
 self.resultLabel.text = "UP"
 } else if inputNumber < randomNumber {
 self.resultLabel.text = "DOWN"
 } else {
 self.resultLabel.text = "정답"
 }
 }
 
 @IBAction func touchUpResetButton(_ sender: UIButton) {
 self.initializeGame()
 }
 
 @IBAction func tabBackGround(_ sender: UITapGestureRecognizer) {
 self.view.endEditing(true)
 }
 
 // MARK: Custom Methods
 func initializeGame() {
 self.randomNumber = arc4random() % 25
 self.turnCount = 0
 
 self.resultLabel.text = "Start!"
 self.turnCountLabel.text = "\(turnCount)"
 self.inputField.text = nil
 
 print("임의의 숫자: \(self.randomNumber)")
 }
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 self.initializeGame()
 }

 */
