//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// SignInViewController - экран авторизации
final class SignInViewController: UIViewController {
    
    private let numberTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "+7-923-222-33-11"
        text.borderStyle = .roundedRect
        text.keyboardType = .numberPad
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "password"
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        return text
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Number"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .orange
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .orange
        return label
    }()
    
    private let sighInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    private let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "бренд")
        image.layer.cornerRadius = 15
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .white
        
        pizzaImageView.frame = CGRect(x: 0, y: 90, width: 320, height: 250)
        pizzaImageView.center.x = view.center.x
        view.addSubview(pizzaImageView)
        
        numberLabel.frame = CGRect(x: 40, y: 385, width: 100, height: 40)
        view.addSubview(numberLabel)
        
        passwordLabel.frame = CGRect(x: 40, y: 490, width: 100, height: 40)
        view.addSubview(passwordLabel)
        
        numberTextField.frame = CGRect(x: 40, y: 430, width: 350, height: 40)
        view.addSubview(numberTextField)
        
        passwordTextField.frame = CGRect(x: 40, y: 535, width: 350, height: 40)
        view.addSubview(passwordTextField)
        
        sighInButton.frame = CGRect(x: 0, y: 650, width: 250, height: 78)
        sighInButton.center.x = view.center.x
        view.addSubview(sighInButton)
        
        sighInButton.addTarget(self, action: #selector(sighInButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func sighInButtonAction(sender: UIButton) {
        
        let chouseVC = ChouseViewController()
        
        let navController = UINavigationController(rootViewController: chouseVC)
        navController.modalPresentationStyle = .fullScreen
        
        present(navController, animated: true)
    }
}
