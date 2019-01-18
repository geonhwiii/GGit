//
//  ViewController.swift
//  GSignUp
//
//  Created by 정건휘 on 18/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    // MARK: IBOutlets
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // MARK: IBActions
    
    @IBAction func signInBtn(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let loginID = UserInformation.shared.id {
            return self.id.text = loginID
        }
        
    }


}

