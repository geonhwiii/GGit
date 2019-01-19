//
//  LoginVC.swift
//  GLoginInfo
//
//  Created by 정건휘 on 19/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let email: String = self.emailField.text,
            email.isEmpty == false else {
                self.showAlert(message: "이메일을 입력해주세요", control: self.emailField)
                return
        }
        
        guard let password: String = self.passwordField.text,
            password.isEmpty == false else {
                self.showAlert(message: "암호를 입력해주세요", control: self.passwordField)
                return
        }
        
        self.performSegue(withIdentifier: "ShowInfo", sender: sender)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "로그인"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Privates
    private func showAlert(message: String, control toBeFirstResponder: UIControl?) {
        let alert: UIAlertController = UIAlertController(title: "알림",
                                                         message: message,
                                                         preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "입력하기", style: .default) { [weak toBeFirstResponder] (action: UIAlertAction) in
            toBeFirstResponder?.becomeFirstResponder()}
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true) {
            print("alert activing...")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email: String = self.emailField.text,
            let password: String = self.passwordField.text else {
                return
        }
        
        guard let id: String = segue.identifier else { return }
        
        guard id == "ShowInfo" else { return }
        
        guard let infoViewController = segue.destination as? InfoVC else {
            return
        }
        
        infoViewController.loginInfo = LoginInfo(email: email, password: password)
    }
    
}
