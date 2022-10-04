//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class SignInViewController: UIViewController {
    
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
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        
        guard Info.info.usersMap[emailTextField.text ?? ""] == passwordTextField.text else {
            errorLabel.text = "Неверный email или пароль"
            print(Info.info.usersMap)
            return
        }
        errorLabel.text = ""
        
        let vc = ViewController()
        
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
}
