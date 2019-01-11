//
//  FrontViewController.swift
//  GSideBar
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {
    
    @IBOutlet var sideBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 메인 컨트롤러의 참조 정보를 가져옴.
        if let revealVC = self.revealViewController() {
            // 버튼이 클릭될 때 메인 컨트롤러에 정의된 revealToggle(_:)을 호출
            self.sideBarButton.target = revealVC
            self.sideBarButton.action = #selector(revealVC.revealToggle(_:))
            
            // 제스처 뷰 추가
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
        }
        
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
