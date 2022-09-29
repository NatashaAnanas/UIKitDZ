//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// PizzaViewController - выбор пиццы
final class PizzaViewController: UIViewController {
    
    private let margaritaImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "маргарита")
        return image
    }()
    
    private let pepperoniImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "пепперони")
        return image
    }()
    
    private let margaritaLabel: UILabel = {
        let label = UILabel()
        label.text = "Margarita"
        label.font = .systemFont(ofSize: 23)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private let pepperoniLabel: UILabel = {
        let label = UILabel()
        label.text = "Pepperoni"
        label.font = .systemFont(ofSize: 23)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    private let margatitaButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        return button
    }()
    
    private let pepperoniButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }

    private func createUI() {
        
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationController?.navigationBar.topItem?.title = ""
        
        view.backgroundColor = .systemYellow
        title = "Pizza"
        
        margaritaImageView.frame = CGRect(x: 40, y: 100, width: 80, height: 80)
        view.addSubview(margaritaImageView)
        
        pepperoniImageView.frame = CGRect(x: 40, y: 200, width: 80, height: 80)
        view.addSubview(pepperoniImageView)
        
        margaritaLabel.frame = CGRect(x: 130, y: 120, width: 200, height: 40)
        view.addSubview(margaritaLabel)
        
        pepperoniLabel.frame = CGRect(x: 130, y: 220, width: 200, height: 40)
        view.addSubview(pepperoniLabel)
        
        margatitaButton.frame = CGRect(x: 40, y: 100, width: 250, height: 80)
        view.addSubview(margatitaButton)
        
        pepperoniButton.frame = CGRect(x: 40, y: 200, width: 250, height: 80)
        view.addSubview(pepperoniButton)
        
        margatitaButton.addTarget(self, action: #selector(orderButtonAction(sender: )), for: .touchUpInside)
        
        pepperoniButton.addTarget(self, action: #selector(orderButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func orderButtonAction(sender: UIButton) {
        
        let makeOrderVC = MakeOrderViewController()
        
        let navController = UINavigationController(rootViewController: makeOrderVC)
        navController.modalPresentationStyle = .formSheet
        
        switch sender.tag {
        case 0:
            makeOrderVC.pizzaNameLabel.text = margaritaLabel.text?.uppercased()
            makeOrderVC.pizzaImageView.image = UIImage(named: "маргарита")
        case 1:
            makeOrderVC.pizzaNameLabel.text = pepperoniLabel.text?.uppercased()
            makeOrderVC.pizzaImageView.image = UIImage(named: "пепперони")
        default:
            break
        }
        
        present(navController, animated: true)
    }
}
