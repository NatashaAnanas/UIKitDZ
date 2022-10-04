//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Экран регистрации
class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var passwordTwoTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()

    }
    
    private func createUI() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: nil) { _ in
            self.view.frame.origin.y = -200
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: nil) { _ in
            self.view.frame.origin.y = 0.0
        }
        
        newEmailTextField.delegate = self
        newPasswordTextField.delegate = self
        passwordTwoTextField.delegate = self
        
    }
    
    private func switchBaseNextTextField(_ textField: UITextField) {
        switch textField {
        case newEmailTextField:
            newPasswordTextField.becomeFirstResponder()
        case newPasswordTextField:
            passwordTwoTextField.becomeFirstResponder()
        case passwordTwoTextField:
            passwordTwoTextField.resignFirstResponder()
        default:
            passwordTwoTextField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBaseNextTextField(textField)
        return true
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
