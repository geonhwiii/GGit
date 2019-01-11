//
//  SideBarViewController.swift
//  GSidebar-nonLib
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class SideBarViewController: UITableViewController {
    
    // MARK: - Properties
    // 메뉴 제목 배열
    let titles = ["메뉴 01", "메뉴 02", "메뉴 03", "메뉴 04", "메뉴 05"]
    
    // 메뉴 아이콘 배열
    let icons = [
    UIImage(named: "icon01.png"),
    UIImage(named: "icon02.png"),
    UIImage(named: "icon03.png"),
    UIImage(named: "icon04.png"),
    UIImage(named: "icon05.png")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 계정 정보를 표시할 레이블 객체를 정의
        let accountLabel = UILabel()
        accountLabel.frame = CGRect(x: 10, y: 30, width: self.view.frame.width, height: 30)
        
        accountLabel.text = "g01063962671@gmail.com"
        accountLabel.textColor = UIColor.white
        accountLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        // 테이블 뷰 상단에 표시될 뷰를 정의
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
        v.backgroundColor = UIColor.orange
        v.addSubview(accountLabel)
        
        // 생성한 v를 테이블 헤더 뷰 영역에 등록
        self.tableView.tableHeaderView = v
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id = "menuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: id) ?? UITableViewCell(style: .default, reuseIdentifier: id)

        cell.textLabel?.text = self.titles[indexPath.row]
        cell.imageView?.image = self.icons[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)

        return cell
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
