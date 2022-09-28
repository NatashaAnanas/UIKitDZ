//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// SignInViewController - экран авторицаэции
class SignInViewController: UIViewController {
    
    let numberTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "+7-923-222-33-11"
        text.borderStyle = .roundedRect
        return text
    }()
    
    let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "password"
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        return text
    }()
    
    let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Number"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let sighInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.backgroundColor = .orange
        image.layer.cornerRadius = 15
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    func createUI() {
        
        view.backgroundColor = .systemPurple
        
        pizzaImageView.frame = CGRect(x: 0, y: 100, width: 200, height: 200)
        pizzaImageView.center.x = view.center.x
        view.addSubview(pizzaImageView)
        
        numberLabel.frame = CGRect(x: 40, y: 355, width: 100, height: 40)
        view.addSubview(numberLabel)
        
        passwordLabel.frame = CGRect(x: 40, y: 455, width: 100, height: 40)
        view.addSubview(passwordLabel)
        
        numberTextField.frame = CGRect(x: 40, y: 400, width: 350, height: 40)
        view.addSubview(numberTextField)
        
        passwordTextField.frame = CGRect(x: 40, y: 500, width: 350, height: 40)
        view.addSubview(passwordTextField)
        
        sighInButton.frame = CGRect(x: 0, y: 650, width: 250, height: 70)
        sighInButton.center.x = view.center.x
        view.addSubview(sighInButton)
        
        sighInButton.addTarget(self, action: #selector(sighInButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc func sighInButtonAction(sender: UIButton) {
        
        let chouseVC = ChouseViewController()

//        navigationController?.pushViewController(chouseVC, animated: false)
        
        let navController = UINavigationController(rootViewController: chouseVC)
        
        navController.modalPresentationStyle = .fullScreen
        
        present(navController, animated: true)
    }
}
