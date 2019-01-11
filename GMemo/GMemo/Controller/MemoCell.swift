//
//  MemoCell.swift
//  GMemo
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet var subject: UILabel!     // 메모 제목
    @IBOutlet var contents: UILabel!    // 메모 내용
    @IBOutlet var regdate: UILabel!     // 등록 일자
    @IBOutlet var regTime: UILabel!     // 등록 시간
    @IBOutlet var img: UIImageView!     // 이미지
    

}
