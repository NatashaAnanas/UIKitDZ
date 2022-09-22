//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class ViewController: UIViewController {
    
    var storage = Storage()
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var singInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton()
    }
    
    @IBAction func buttonSingAction(_ sender: Any) {
        
        let emailText = emailTextField.text ?? ""
        let passwordText = passwordTextField.text ?? ""
        
        if  storage.infoUsers[emailText] == passwordText {

            errorLabel.text = ""
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let newVC = storyboard.instantiateViewController(
                withIdentifier: "vc2"
            ) as? ViewControllerTwo else { return }
            self.present(newVC, animated: true)
        } else {
            errorLabel.text = "Введен неверный логин или пароль"
        }
    }
    
    func createButton() {
        singInButton.layer.cornerRadius = 17
    }

    @IBAction func eyeButtonAction(_ sender: Any) {
        let eyeClose = UIImage(systemName: "eyes.inverse")
        let eye = UIImage(systemName: "eyes")
        
        if self.passwordTextField.isSecureTextEntry {
            self.passwordTextField.isSecureTextEntry = false
            eyeButton.setImage(eyeClose, for: .normal)
        } else {
            self.passwordTextField.isSecureTextEntry = true
            eyeButton.setImage(eye, for: .normal)
        }
    }
}
