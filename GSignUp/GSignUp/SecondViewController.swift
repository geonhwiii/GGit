//
//  SecondViewController.swift
//  GSignUp
//
//  Created by 정건휘 on 18/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: - Properties
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var pwCheckField: UITextField!
    @IBOutlet var nextBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(imageSelect(_:)))
        self.imageView.addGestureRecognizer(tap)
        self.imageView.isUserInteractionEnabled = true
        
        if self.idField.text?.isEmpty == true || self.pwField.text?.isEmpty == true || self.pwCheckField.text?.isEmpty == true {
            self.nextBtn.isEnabled = false
        }
        
        
        
    }
    
    // MARK: - Methods
    // MARK: IBActions
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        UserInformation.shared.id = idField.text
        UserInformation.shared.password = pwField.text
        UserInformation.shared.checkPassword = pwCheckField.text
        
    }
    
    @objc func imageSelect(_ sender: UIImageView) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    // MARK: Custom Method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let edittedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = edittedImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    


}

