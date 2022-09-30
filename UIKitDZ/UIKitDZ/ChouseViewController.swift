//
//  ChouseViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// ChouseViewController - выбор меню: пицца, паста, супы, бургеры
final class ChouseViewController: UIViewController {
    
    private let pizzaButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 40
//        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true
        button.setImage(UIImage(named: "pizza_menu"), for: .normal)
        return button
    }()
    
    private let burgerButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.setImage(UIImage(named: "burger_button"), for: .normal)
        return button
    }()
    
    private let pastaButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.setImage(UIImage(named: "pasta_button"), for: .normal)
        return button
    }()
    
    private let soupButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 40
        button.clipsToBounds = true
        button.setImage(UIImage(named: "soup_button"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        
        title = "Food"
        
        view.backgroundColor = .systemYellow
        
        pizzaButton.frame = CGRect(x: 0, y: 100, width: 300, height: 130)
        pizzaButton.center.x = view.center.x
        view.addSubview(pizzaButton)
        
        burgerButton.frame = CGRect(x: 0, y: 400, width: 300, height: 130)
        burgerButton.center.x = view.center.x
        view.addSubview(burgerButton)
        
        pastaButton.frame = CGRect(x: 0, y: 250, width: 300, height: 130)
        pastaButton.center.x = view.center.x
        view.addSubview(pastaButton)
        
        soupButton.frame = CGRect(x: 0, y: 550, width: 300, height: 130)
        soupButton.center.x = view.center.x
        view.addSubview(soupButton)
        
        pizzaButton.addTarget(self, action: #selector(pizzaButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func pizzaButtonAction(sender: UIButton) {
        
        let pizzaVC = PizzaViewController()
        
        let navController = UINavigationController(rootViewController: pizzaVC)
        navController.modalPresentationStyle = .formSheet
        
        show(pizzaVC, sender: true)
    }
}
