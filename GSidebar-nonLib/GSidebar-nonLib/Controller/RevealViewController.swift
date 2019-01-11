//
//  RevealViewController.swift
//  GSidebar-nonLib
//
//  Created by 정건휘 on 11/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class RevealViewController: UIViewController {
    
    // MARK: - Properties
    var contentVC: UIViewController?    // 컨텐츠 뷰 담당 컨트롤러
    var sideVC: UIViewController?       // 사이드 바 메뉴 담당 컨트롤러
    
    var isSideBarShowing = false        // 사이드 바 on/off 상태
    
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH: CGFloat = 260    // 사이드 바 열릴 넓이

    // MARK: - Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()

    }
    
    // MARK: - function
    // 초기 화면 설정.
    func setupView() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            // 읽어온 컨트롤러를 클래스 전체에서 참조할 수 있도록 contentVC 속성에 저장.
            self.contentVC = vc
            // 1~3번은 _프론트 컨트롤러를 메인컨트롤러의 자식으로 설정하는 과정.
            // 1.vc(_프론트 뷰 컨트롤러)를 메인 컨트롤러의 자식으로 등록.
            self.addChild(vc)
            // 2.vc를 메인 컨트롤러의 서브뷰로 등록.
            self.view.addSubview(vc.view)
            // 3.vc에 부모 뷰 컨트롤러가 바뀌었음을 알림.
            vc.didMove(toParent: self)
            
        }
        
    }
    
    // 사이드 바 뷰 읽어옴.
    func getSideView() {
        // sideVC는 메모리 낭비를 막기 위해 nil일 수도 있으므로, nil의 여부를 체크한다.
        if self.sideVC == nil {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") {
                // 다른 메소드에도 참조할 수 있도록 sideVC 속성에 저장
                self.sideVC = vc
                self.addChild(vc)
                self.view.addSubview(vc.view)
                vc.didMove(toParent: self)
                // vc의 뷰를 제일 위로 올림. 사이드 바 뷰가 컨텐츠 뷰를 덮는 것을 방지.
                self.view.bringSubviewToFront((self.contentVC?.view)!)
            }
        }
    }
    
    // 컨텐츠 뷰에 그림자 효과
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        if (shadow == true) {
            self.contentVC?.view.layer.cornerRadius = 10    // 그림자 모서리 둥글기
            self.contentVC?.view.layer.shadowOpacity = 0.8  // 그림자 투명도
            self.contentVC?.view.layer.shadowColor = UIColor.black.cgColor  // 그림자 색상
            self.contentVC?.view.layer.shadowOffset = CGSize(width: offset, height: offset) // 그림자 크기
        } else {
            self.contentVC?.view.layer.cornerRadius = 0.0
            self.contentVC?.view.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    // 사이드 바 오픈
    func openSideBar(_ complete: ( () -> Void)? ) {
        self.getSideView()  // 사이드 바 뷰를 읽어옴.
        self.setShadowEffect(shadow: true, offset: -2)
        
        // 애니메이션 옵션
        // replace : UIViewAnimationOptions -> UIView.AnimationOptions
        // curveEaseInout : 애니메이션 구간별 속도 옵션(시작,끝은 느리고 중간은 빠르게)
        // beginFromCurrentState : 다른 애니메이션이 진행 중일지라도 지금 바로 실행
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                       delay: TimeInterval(0),
                       options: options,
                       animations: {
                        self.contentVC?.view.frame = CGRect(x: self.SIDEBAR_WIDTH, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        },
                       completion : {
                        if $0 == true {
                            self.isSideBarShowing = true
                            // 함수가 비어있을 경우 호출하면 안되므로 옵셔널 체인
                            complete?()
                        }
        }
        )
    }
    
    // 사이드 바 클로즈
    func closeSideBar(_ complete: ( () -> Void)? ) {
        let options = UIView.AnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        UIView.animate(withDuration: TimeInterval(self.SLIDE_TIME),
                       delay: TimeInterval(0),
                       options: options,
                       animations: {
                        self.contentVC?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        },
                       completion: {
                        if $0 == true {
                            // 사이드 바 뷰 제거
                            self.sideVC?.view.removeFromSuperview()
                            self.sideVC = nil
                            self.isSideBarShowing = false
                            self.setShadowEffect(shadow: false, offset: 0)
                            complete?()
                        }
        })
    }
    
}
