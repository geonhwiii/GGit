//
//  SideBarVC.swift
//  GMemo
//
//  Created by 정건휘 on 12/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class SideBarVC: UITableViewController {
    
    // MARK: - Properties
    let namelabel = UILabel()
    let emailLabel = UILabel()
    let profileImage = UIImageView()

    // 목록 데이터 배열
    let titles = ["새글 작성하기", "친구 새글", "달력으로 보기", "공지사항", "통계", "계정 관리"]
    
    // 아이콘 데이터 배열
    let icons = [
        UIImage(named: "icon01.png"),
        UIImage(named: "icon02.png"),
        UIImage(named: "icon03.png"),
        UIImage(named: "icon04.png"),
        UIImage(named: "icon05.png"),
        UIImage(named: "icon06.png")
    ]
    
    // MARK: - Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 큐에서 테이블 셀을 꺼내 온다. 없으면 새로 생성
        let id = "menuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ??
            UITableViewCell(style: .default, reuseIdentifier: id)
        
        // 타이틀과 이미지를 대입
        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 { // 선택된 행이 새글 작성 메뉴일 때 (index : 0)
            if let uv = self.storyboard?.instantiateViewController(withIdentifier: "MemoForm") {
                let target = self.revealViewController()?.frontViewController as! UINavigationController
                target.pushViewController(uv, animated: true)
                
                // 목록화면 전환 시 사이드바를 닫아줌.
                self.revealViewController()?.revealToggle(self)
            }
        } else if indexPath.row == 5 { // 계정 관리
            if let uv = self.storyboard?.instantiateViewController(withIdentifier: "_Profile") {
                self.present(uv, animated: true) {
                    self.revealViewController()?.revealToggle(self)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        // 테이블 뷰의 헤더 역할을 할 뷰를 정의
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70))
        
        headerView.backgroundColor = UIColor.orange
        
        // 테이블 뷰의 헤더 뷰로 지정
        self.tableView.tableHeaderView = headerView
        
        // 이름 레이블의 속성을 정의하고, 헤더 뷰에 추가
        self.namelabel.frame = CGRect(x: 70, y: 15, width: 100, height: 30)
        self.namelabel.text = "건휘"
        self.namelabel.textColor = UIColor.white
        self.namelabel.font = UIFont.boldSystemFont(ofSize: 15)
        self.namelabel.backgroundColor = UIColor.clear
        headerView.addSubview(self.namelabel)
        
        // email 속성 저의, 헤더 뷰에 추가
        self.emailLabel.frame = CGRect(x: 70, y: 30, width: 100, height: 30)
        self.emailLabel.text = "gunw@gmail.com"
        self.emailLabel.textColor = UIColor.white
        self.emailLabel.font = UIFont.systemFont(ofSize: 11)
        
        headerView.addSubview(self.emailLabel)
        
        // 기본 이미지 구현
        let defaultProfile = UIImage(named: "account.jpg")
        self.profileImage.image = defaultProfile
        self.profileImage.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        
        
        // 프로필 이미지 둥글게
        self.profileImage.layer.cornerRadius = (self.profileImage.frame.width / 2)
        self.profileImage.layer.borderWidth = 0 // 테두리 두께 0
        self.profileImage.layer.masksToBounds = true
        view.addSubview(self.profileImage)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
