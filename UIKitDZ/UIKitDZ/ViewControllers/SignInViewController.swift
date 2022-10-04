//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        signInButton.layer.cornerRadius = 20
        signInButton.clipsToBounds = true
        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBaseNextTextField(textField)
        return true
    }
    
    @IBAction private func signInButtonAction(_ sender: Any) {
        
        guard Info.info.usersMap[emailTextField.text ?? ""] == passwordTextField.text else {
            errorLabel.text = "Неверный email или пароль"
            print(Info.info.usersMap)
            return
        }
        errorLabel.text = ""
        
        let tabBarVc = BaseTabBarController()
        
        let navController = UINavigationController(rootViewController: tabBarVc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
}
