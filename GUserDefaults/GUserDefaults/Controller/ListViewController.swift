//
//  ListViewController.swift
//  GUserDefaults
//
//  Created by 정건휘 on 12/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    // MARK: - Properties
    // MARK: IBOutlets
    @IBOutlet var name: UILabel!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var married: UISwitch!
    
    // MARK: IBActions
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex     // 0: 남, 1: 여
        let plist = UserDefaults.standard
        plist.set(value, forKey: "gender")
        plist.synchronize() // 동기화
    }
    
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn
        let plist = UserDefaults.standard
        plist.set(value, forKey: "married")
        plist.synchronize() // 동기화
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // 입력이 가능한 알림창을 띄워 이름을 수정할 수 있게 한다.
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요", preferredStyle: .alert)
            
            // 입력 필드 추가
            alert.addTextField() {
                $0.text = self.name.text // name 레이블의 텍스트를 입력폼에 기본값으로 넣어준다.
            }
            
            // 버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                // 사용자가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장.
                let value = alert.textFields?[0].text
                let plist = UserDefaults.standard
                plist.setValue(value, forKey: "name") // "name"으로 키 값 저장
                plist.synchronize()
                
                self.name.text = value
            })
            // 알림창을 띄움
            self.present(alert, animated: false, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}
