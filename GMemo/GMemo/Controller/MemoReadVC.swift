//
//  MemoReadVC.swift
//  GMemo
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {

    // MARK: - Properties
    // 콘텐츠 데이터를 저장하는 변수
    var param : MemoData?
    
    // MARK: IBOutlets
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        // param값을 각 아울렛에 입력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image

        let dateFormat = DateFormatter()
        let timeFormat = DateFormatter()
        dateFormat.dateFormat = "dd일 "
        timeFormat.dateFormat = "HH:mm분에 작성됨"
        let dateString = dateFormat.string(from: (param?.regdate)!)
        let timeString = timeFormat.string(from: (param?.regTime)!)
        
        self.navigationItem.title = dateString + timeString
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
