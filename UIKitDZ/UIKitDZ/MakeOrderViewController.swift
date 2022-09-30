//
//  MakeOrderViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// MakeOrderViewController - формируем заказ, выбираем ингредиенты для пиццы
final class MakeOrderViewController: UIViewController {
    
    let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let cheesLabel: UILabel = {
        let label = UILabel()
        label.text = "Моцарелла"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let hamLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветчина"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let mushroomsLabel: UILabel = {
        let label = UILabel()
        label.text = "Грибы"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let oliveLabel: UILabel = {
        let label = UILabel()
        label.text = "Оливки"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    let pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let cheesSwitch: UISwitch = {
        let sw = UISwitch()
        sw.tag = 0
        return sw
    }()
    
    private let hamSwitch: UISwitch = {
        let sw = UISwitch()
        sw.tag = 1
        return sw
    }()
    
    private let mushroomsSwitch: UISwitch = {
        let sw = UISwitch()
        sw.tag = 2
        return sw
    }()
    
    private  let oliveSwitch: UISwitch = {
        let sw = UISwitch()
        sw.tag = 3
        return sw
    }()
    
    private let chouseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.setTitle("Выбрать", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(UIColor.systemYellow, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .systemYellow
        
        pizzaImageView.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        pizzaImageView.center.x = view.center.x
        view.addSubview(pizzaImageView)
        
        cheesLabel.frame = CGRect(x: 40, y: 450, width: 150, height: 40)
        view.addSubview(cheesLabel)
        
        hamLabel.frame = CGRect(x: 40, y: 510, width: 150, height: 40)
        view.addSubview(hamLabel)
        
        mushroomsLabel.frame = CGRect(x: 40, y: 570, width: 150, height: 40)
        view.addSubview(mushroomsLabel)
        
        oliveLabel.frame = CGRect(x: 40, y: 630, width: 150, height: 40)
        view.addSubview(oliveLabel)
        
        pizzaNameLabel.frame = CGRect(x: 0, y: 30, width: 200, height: 50)
        pizzaNameLabel.center.x = view.center.x
        view.addSubview(pizzaNameLabel)
        
        cheesSwitch.frame = CGRect(x: 300, y: 450, width: 40, height: 30)
        view.addSubview(cheesSwitch)
        
        hamSwitch.frame = CGRect(x: 300, y: 510, width: 40, height: 30)
        view.addSubview(hamSwitch)
        
        mushroomsSwitch.frame = CGRect(x: 300, y: 570, width: 40, height: 30)
        view.addSubview(mushroomsSwitch)
        
        oliveSwitch.frame = CGRect(x: 300, y: 630, width: 40, height: 30)
        view.addSubview(oliveSwitch)
        
        chouseButton.frame = CGRect(x: 0, y: 700, width: 250, height: 70)
        chouseButton.center.x = view.center.x
        view.addSubview(chouseButton)
        
        chouseButton.addTarget(self, action: #selector(chouseButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func chouseButtonAction(sender: UIButton) {
        
        let billVC = BillViewController()
        
        let navController = UINavigationController(rootViewController: billVC)
        
        // через guard не работало
    
        if cheesSwitch.isOn {
        billVC.ingeedientsrLabel.text? += "\(cheesLabel.text ?? "Моцарелла ") "
        }
        if hamSwitch.isOn {
        billVC.ingeedientsrLabel.text? += "\(hamLabel.text ?? "Ветчина ") "
        }
        if mushroomsSwitch.isOn {
        billVC.ingeedientsrLabel.text? += "\(mushroomsLabel.text ?? "Грибы ") "
        }
        if oliveSwitch.isOn {
        billVC.ingeedientsrLabel.text? += "\(oliveLabel.text ?? "Оливки ") "
        }
        
        billVC.pizzaImageView.image = pizzaImageView.image
        billVC.pizzaLabel.text = pizzaNameLabel.text?.uppercased()
        
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}
