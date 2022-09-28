//
//  PizzaViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// PizzaViewController - выбор пиццы
class PizzaViewController: UIViewController {
    
    let margaritaImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.backgroundColor = .magenta
        return image
    }()
    
    let pepperoniImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.backgroundColor = .magenta
        return image
    }()
    
    let margaritaLabel: UILabel = {
        let label = UILabel()
        label.text = "Маргарита"
        label.font = .systemFont(ofSize: 23)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    let pepperoniLabel: UILabel = {
        let label = UILabel()
        label.text = "Пепперони"
        label.font = .systemFont(ofSize: 23)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    let margatitaButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let pepperoniButton: UIButton = {
        let button = UIButton()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }

    func createUI() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: nil)
        
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
    
    @objc func orderButtonAction(sender: UIButton) {
        
//        let makeOrderVC = MakeOrderViewController()
//
//        let navController = UINavigationController(rootViewController: makeOrderVC)
//
//        navController.modalPresentationStyle = .fullScreen
//        show(makeOrderVC, sender: true)
        
        let makeOrderVC = MakeOrderViewController()
        
        let navController = UINavigationController(rootViewController: makeOrderVC)
        navController.modalPresentationStyle = .formSheet
        present(navController, animated: true)
    }
}
