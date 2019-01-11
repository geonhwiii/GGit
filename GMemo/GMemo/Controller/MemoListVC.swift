//
//  MemoListVC.swift
//  GMemo
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {
    
    // 앱 델리게이트 객체의 참조 정보 읽어옴.
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 테이블 데이터를 리로드. 이에 따라 행을 구성하는 로직이 재실행
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // 테이블 뷰 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = self.appDelegate.memolist.count
        return count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // memolist 배열 데이터에서 주어진 행에 맞는 데이터 꺼냄
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 이미지가 비었을 경우 memoCell, 아니면 memoCellWithImage. 위 아래 셀 선택
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 재사용 큐
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        // memoCell 내용 구성
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // date 타입 날짜를 포맷
        let dateFormat = DateFormatter()
        let timeFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        timeFormat.dateFormat = "HH:mm:ss"
        cell.regdate?.text = dateFormat.string(from: row.regdate!)
        cell.regTime?.text = timeFormat.string(from: row.regTime!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    

}
