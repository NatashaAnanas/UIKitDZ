//
//  RegistrationViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Экран регистрации
final class RegistrationViewController: UIViewController {
    
    private enum Constants {
        static let successReg = "Регистрация прошла успешно"
        static let differentPassword = "Пароли не совпадают"
        static let errorEmail = "Такой email уже существует"
        static let emptyText = ""
    }
    
    // MARK: - private @IBOutlet
    
    @IBOutlet private weak var newEmailTextField: UITextField!
    @IBOutlet private weak var newPasswordTextField: UITextField!
    @IBOutlet private weak var passwordTwoTextField: UITextField!
    @IBOutlet private weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Public methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBaseNextTextField(textField)
        return true
    }
    
    // MARK: - Private @IBAction
    
    @IBAction private func regButtonAction(_ sender: Any) {
        
        let email = newEmailTextField.text ?? Constants.emptyText
        let password = passwordTwoTextField.text ?? Constants.emptyText
        
        guard Info.info.usersMap[newEmailTextField.text ?? ""] != nil else {

            if newPasswordTextField.text == passwordTwoTextField.text {
                
                Info.info.usersMap[email] = password
                infoLabel.text = Constants.successReg
                
                UserDefaults.standard.set(Info.info.usersMap, forKey: "dict")
            } else {
                infoLabel.text = Constants.differentPassword
            }
            return
        }
        infoLabel.text = Constants.errorEmail
    }
    
    // MARK: - Private methods
    
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
}
