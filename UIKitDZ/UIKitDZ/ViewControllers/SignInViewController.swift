//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// SignInViewController - экран регистрации
final class SignInViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let faceIdSwitch: UISwitch = {
        let swit = UISwitch()
        swit.isOn = false
        return swit
    }()
    
    let faceIdLabel: UILabel = {
        let label = UILabel()
        label.text = "Вxод по face ID"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemIndigo
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        return button
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .systemIndigo
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .systemIndigo
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    let eyeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.tintColor = .tertiaryLabel
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        return button
    }()
    
    let reminderLabel: UILabel = {
        let label = UILabel()
        label.text = "Birthday Reminder"
        label.textColor = .systemIndigo
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    let signInLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Sign In"
        label.font = .systemFont(ofSize: 35)
        return label
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.text = ""
        label.font = .systemFont(ofSize: 19)
        return label
    }()
    
    let storage = Storage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        
        // MARK: - Create Label
        
        reminderLabel.frame = CGRect(x: 0, y: 140, width: 300, height: 90)
        reminderLabel.textAlignment = .center
        reminderLabel.center.x = view.center.x
        view.addSubview(reminderLabel)
        
        signInLabel.frame = CGRect(x: 50, y: 310, width: 150, height: 80)
        view.addSubview(signInLabel)
        
        emailLabel.frame = CGRect(x: 50, y: 380, width: 100, height: 40)
        view.addSubview(emailLabel)
        
        passwordLabel.frame = CGRect(x: 50, y: 480, width: 100, height: 40)
        view.addSubview(passwordLabel)
        
        faceIdLabel.frame = CGRect(x: 150, y: 596, width: 150, height: 40)
        view.addSubview(faceIdLabel)
        
        errorLabel.frame = CGRect(x: 0, y: 730, width: 330, height: 40)
        errorLabel.center.x = view.center.x
        view.addSubview(errorLabel)
        
        // MARK: - Create TextField
        
        emailTextField.frame = CGRect(x: 50, y: 420, width: 300, height: 45)
        emailTextField.borderStyle = .roundedRect
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 50, y: 520, width: 300, height: 45)
        passwordTextField.borderStyle = .roundedRect
        view.addSubview(passwordTextField)
        
        // MARK: - Create Button
        
        signInButton.frame = CGRect(x: 0, y: 660, width: 300, height: 50)
        signInButton.center.x = view.center.x
        signInButton.layer.cornerRadius = 17
        view.addSubview(signInButton)
        
        eyeButton.frame = CGRect(x: 260, y: 3, width: 40, height: 40)
        self.passwordTextField.addSubview(eyeButton)
        
        // MARK: - create Switch
        
        faceIdSwitch.frame = CGRect(x: 295, y: 600, width: 1, height: 1)
        faceIdSwitch.isOn = true
        view.addSubview(faceIdSwitch)
        
        eyeButton.addTarget(self, action: #selector(showPassword(sender: )), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(buttonAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func buttonAction(sender: UIButton) {
        
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        
        if  storage.info[emailText.lowercased()] == passwordText {
            
            let secondVC = InfoListViewController()
            self.navigationController?.pushViewController(secondVC, animated: false)
        } else {
            errorLabel.text = "Введен неверный логин или пароль"
        }
    }
    
    @objc private func showPassword(sender: UIButton) {
        
        let eyeClose = UIImage(systemName: "eye.slash")
        let eye = UIImage(systemName: "eye")
        
        if self.passwordTextField.isSecureTextEntry {
            self.passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(eyeClose, for: .normal)
        } else {
            self.passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(eye, for: .normal)
        }
    }
}
