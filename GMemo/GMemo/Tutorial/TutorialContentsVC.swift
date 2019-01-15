//
//  TutorialContentsVC.swift
//  GMemo
//
//  Created by 정건휘 on 15/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class TutorialContentsVC: UIViewController {
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var bgImageView: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!

    override func viewDidLoad() {
        // 전달받을 타이틀 정보를 레이블 객체에 대입하고 크기를 조절.
        self.titleLable.text = self.titleText
        self.titleLable.sizeToFit()
        
        // 전달받은 이미지 정보를 이미지 뷰에 대입
        self.bgImageView.image = UIImage(named: self.imageFile)
        
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
