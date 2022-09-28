//
//  ChouseViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// ChouseViewController - выбор заказа pizza или суши
class ChouseViewController: UIViewController {
    
    let pizzaButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Pizza", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    let sushiButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("Sushi", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Food"
        
        createUI()
    }
    
    func createUI() {
        view.backgroundColor = .yellow
        
        pizzaButton.frame = CGRect(x: 0, y: 100, width: 350, height: 120)
        pizzaButton.center.x = view.center.x
        view.addSubview(pizzaButton)
        
        sushiButton.frame = CGRect(x: 0, y: 250, width: 350, height: 120)
        sushiButton.center.x = view.center.x
        view.addSubview(sushiButton)
        
        pizzaButton.addTarget(self, action: #selector(pizzaButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc func pizzaButtonAction(sender: UIButton) {
        
        let pizzaVC = PizzaViewController()
        
        let navController = UINavigationController(rootViewController: pizzaVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}
