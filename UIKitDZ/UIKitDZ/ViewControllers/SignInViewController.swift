//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// Экран входа
final class SignInViewController: UIViewController {
    
    private enum Constants {
        static let errorEmailPassword = "Неверный email или пароль"
        static let emptyText = ""
    }
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Public method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBaseNextTextField(textField)
        return true
    }
    
    // MARK: - @IBAction
    
    @IBAction private func signInButtonAction(_ sender: Any) {
        
        guard Info.info.usersMap[emailTextField.text ?? Constants.emptyText] == passwordTextField.text else {
            errorLabel.text = Constants.errorEmailPassword
            return
        }
        errorLabel.text = Constants.emptyText
        
        let tabBarVc = BaseTabBarController()
        
        let navController = UINavigationController(rootViewController: tabBarVc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    // MARK: - Private method
    
    private func createUI() {
        signInButton.layer.cornerRadius = 20
        signInButton.clipsToBounds = true
        signInButton.layer.borderWidth = 5
        signInButton.layer.borderColor = UIColor.red.cgColor
        
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
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func switchBaseNextTextField(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
        }
    }
}

extension SignInViewController {
    
}
