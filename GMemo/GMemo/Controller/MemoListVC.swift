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
        // SWRevealViewController 라이브러리의 revealViewController 객체를 읽어옴
        if let revealVC = self.revealViewController() {
            
            // 바 버튼 아이템 객체 정의
            let btn = UIBarButtonItem()
            btn.image = UIImage(named: "sidemenu.png")
            btn.target = revealVC // 버튼 클릭 시 호출할 메소드가 정의된 객체 지정
            btn.action = #selector(revealVC.revealToggle(_:))
            
            // 정의된 바 버튼을 내비게이션 바의 왼쪽 아이템으로 등록.
            self.navigationItem.leftBarButtonItem = btn
            
            // 제스처 객체를 뷰에 추가
            self.view.addGestureRecognizer(revealVC.panGestureRecognizer())
            
        }
        
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? MemoCell else {
            fatalError("Could not dequeue cell")
    
        }
        
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
        // memolist 배열에서 선택된 행에 맞는 데이터를 가져옴
        let row = self.appDelegate.memolist[indexPath.row]
        
        // 상세 화면의 인스턴스 생성
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoReadVC else {
            print("MemoRead ID를 찾을 수 없음")
            return
        }
        
        // 값 전달 후 이동
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
