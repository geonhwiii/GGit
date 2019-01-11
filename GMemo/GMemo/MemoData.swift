//
//  MemoData.swift
//  GMemo
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

// MARK: - DataSet
class MemoData {
    var memoIdx: Int?       // 데이터 식별값
    var title: String?      // 메모 제목
    var contents: String?   // 메모 내용
    var image: UIImage?     // 이미지
    var regdate: Date?      //작성일
    var regTime: Date?      // 작성시간
}
