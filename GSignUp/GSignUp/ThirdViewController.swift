//
//  ThirdViewController.swift
//  GSignUp
//
//  Created by 정건휘 on 18/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func datePicker(_ sender: Any) {
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButton(_ sender: Any) {
    }
    
    
}
