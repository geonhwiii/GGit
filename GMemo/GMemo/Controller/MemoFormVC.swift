//
//  MemoFormVC.swift
//  GMemo
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    var subject: String! // 제목을 저장할 변수
    
    // MARK: - Properties
    // MARK: IBOutlets
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    // MARK: IBActions
    // 저장 버튼 컨트롤
    @IBAction func save(_ sender: Any) {
        // 경고창에 사용될 콘텐츠 뷰 컨트롤러
        let alertV = UIViewController()
        let iconImage = UIImage(named: "warning-icon-60.png")
        alertV.view = UIImageView(image: iconImage)
        alertV.preferredContentSize = iconImage?.size ?? CGSize.zero
        
        
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.setValue(alertV, forKey: "contentViewController") // 경고창 추가
            self.present(alert, animated: true)
            return
        }
        
        // MemoData객체 생성
        let data = MemoData()
        
        data.title = self.subject           // 제목
        data.contents = self.contents.text  // 내용
        data.image = self.preview.image     // 이미지
        data.regdate = Date() // 작성 날짜
        data.regTime = Date() // 작성시각
        
        // 앱 델리게이트 객체를 읽어와서 memolist에 MemoData 객체를 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // 카메라 버튼 컨트롤
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        // self를 picker로 입력하여 에러가 발생했었음. 로그로 남겨놓음.
        print("카메라 버튼 클릭시 에러가 나면 picker 확인")
        // 이미지 피커 화면 표시
        self.present(picker, animated: false)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지를 미리보기에 표시
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫음
        picker.dismiss(animated: false)
    }
    
    override func viewDidLoad() {
        self.contents.delegate = self

        // 배경 이미지 설정
        let bgImage = UIImage(named: "memo-background.png")!
        self.view.backgroundColor = UIColor(patternImage: bgImage)
        
        // 텍스트 뷰의 기본 속성
        self.contents.layer.borderWidth = 0
        self.contents.layer.borderColor = UIColor.clear.cgColor
        self.contents.backgroundColor = UIColor.clear
        
        // 줄 간격
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 9
        self.contents.attributedText = NSAttributedString(string: " ", attributes: [NSAttributedString.Key.paragraphStyle : style])
        self.contents.text = ""
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // 내용의 최대 15자리까지 읽어 subject 변수에 저장.
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length) // 최대 15자리
        self.subject = contents.substring(with: NSRange(location: 0, length: length)) // 0~length 까지만 자름
        
    }
    
    // 토글 형식으로 내비게이션 바를 위로 올림.
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let bar = self.navigationController?.navigationBar
        
        let ts = TimeInterval(0.3)
        UIView.animate(withDuration: ts) {
            bar?.alpha = ( bar?.alpha == 0 ? 1 : 0 )
        }
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
