//
//  PickerController.swift
//  GHR
//
//  Created by 정건휘 on 17/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit
class DepartPickerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let departDAO = DepartmentDAO()
    var departList: [(departCd: Int, departTitle: String, departAddr: String)]!
    var pickerView: UIPickerView!
    
    // 현재 피커뷰에 선택되어 있는 부서의 코드를 가져옴.
    var selectedDepartCd: Int {
        let row = self.pickerView.selectedRow(inComponent: 0)
        return self.departList[row].departCd
    }
    
    override func viewDidLoad() {
        // 1. DB에서 부서 목록을 가져와 튜플 배열 초기화
        self.departList = self.departDAO.find()
        // 2. 피커 뷰 객체 초기화, 최상위 뷰의 서브 뷰로 추가.
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.view.addSubview(self.pickerView)
        
        // 3. 외부에서 뷰 컨트롤러를 참조할 때를 위한 사이즈를 지정
        let pWidth = self.pickerView.frame.width
        let pHeight = self.pickerView.frame.height
        self.preferredContentSize = CGSize(width: pWidth, height: pHeight)
    }
    
    // 피커뷰에 표시될 전체 컴포넌트 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 특정 컴포넌트의 행 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.departList.count
    }
    
    // 피커뷰의 각 행에 표시될 뷰를 결정하는 메소드
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let titleView = view as? UILabel ?? {
            let titleView = UILabel()
            titleView.font = UIFont.systemFont(ofSize: 14)
            titleView.textAlignment = .center
            return titleView
        }()
        
        titleView.text = "\(self.departList[row].departTitle) (\(self.departList[row].departAddr))"
        return titleView
    }
    
}
