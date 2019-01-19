//
//  InfoVC.swift
//  GLoginInfo
//
//  Created by 정건휘 on 19/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    
    // MARK: - Properties
    var loginInfo: LoginInfo?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "로그인 정보"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("infoVC activing...")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        guard let info = self.loginInfo else {
            return
        }
        print(info)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
