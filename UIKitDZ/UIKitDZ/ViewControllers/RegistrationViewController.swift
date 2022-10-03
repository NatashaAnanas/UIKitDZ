//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Экран регистрации
class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    
    var info = Info()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registrationButtonAction(_ sender: Any) {
        
        guard info.usersMap[emailTextField.text ?? ""] != nil else {
            info.usersMap.updateValue(passwordTextField.text ?? "", forKey: emailTextField.text ?? "")
            return
        }
        
        infoLabel.text = "Такой email уже существует"
        
//        if passwordTextField.text == passwordTwoTextField.text {
//
//            if info.usersMap[emailTextField.text ?? ""] == passwordTextField.text {
//                infoLabel.text = "Такой email уже существует"
//            } else {
//
//                infoLabel.text = ""
//                if passwordTextField.text == passwordTwoTextField.text {
//                    info.usersMap.updateValue(passwordTextField.text ?? "",
//                                              forKey: emailTextField.text ?? "")
//
//                    infoLabel.text = "Регистрация прошла успешно"
//                }
//            }
//        } else {
//            infoLabel.text = "Пароли не совпадают"
//            print(info.usersMap)
//        }
    }
}
