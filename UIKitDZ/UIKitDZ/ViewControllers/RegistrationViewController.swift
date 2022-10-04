//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Экран регистрации
class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
//    var newInfo = Info.info.usersMap
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func regButtonAction(_ sender: Any) {
        
        guard Info.info.usersMap[newEmailTextField.text ?? ""] != nil else {
            
            if newPasswordTextField.text == passwordTwoTextField.text {
                Info.info.usersMap.updateValue(newPasswordTextField.text ?? "", forKey: newEmailTextField.text ?? "")
                infoLabel.text = "Регистрация прошла успешно"
                print(Info.info.usersMap)
               
            } else {
                infoLabel.text = "Пароли не совпадают"
            }
            return
        }
        infoLabel.text = "Такой email уже существует"
    }
}
