//
//  MakeOrderViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// MakeOrderViewController - формируем заказ, выбираем ингредиенты для пиццы
class MakeOrderViewController: UIViewController {
    
    let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .magenta
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let cheesLabel: UILabel = {
        let label = UILabel()
        label.text = "Сыр мацарела"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    let hamLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветчина"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    let mushroomsLabel: UILabel = {
        let label = UILabel()
        label.text = "Грибы"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    let oliveLabel: UILabel = {
        let label = UILabel()
        label.text = "Оливки"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    let cheesSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    let hamSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    let mushroomsSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    let oliveSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    let chouseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    func createUI() {
        
        view.backgroundColor = .systemYellow
        
        pizzaImageView.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        pizzaImageView.center.x = view.center.x
        view.addSubview(pizzaImageView)
        
        cheesLabel.frame = CGRect(x: 40, y: 450, width: 150, height: 40)
        view.addSubview(cheesLabel)
        
        hamLabel.frame = CGRect(x: 40, y: 520, width: 150, height: 40)
        view.addSubview(hamLabel)
        
        mushroomsLabel.frame = CGRect(x: 40, y: 590, width: 150, height: 40)
        view.addSubview(mushroomsLabel)
        
        oliveLabel.frame = CGRect(x: 40, y: 660, width: 150, height: 40)
        view.addSubview(oliveLabel)
        
        cheesSwitch.frame = CGRect(x: 300, y: 450, width: 40, height: 30)
        view.addSubview(cheesSwitch)
        
        hamSwitch.frame = CGRect(x: 300, y: 520, width: 40, height: 30)
        view.addSubview(hamSwitch)
        
        mushroomsSwitch.frame = CGRect(x: 300, y: 590, width: 40, height: 30)
        view.addSubview(mushroomsSwitch)
        
        oliveSwitch.frame = CGRect(x: 300, y: 660, width: 40, height: 30)
        view.addSubview(oliveSwitch)
        
        chouseButton.frame = CGRect(x: 0, y: 720, width: 250, height: 70)
        chouseButton.center.x = view.center.x
        view.addSubview(chouseButton)
        
        chouseButton.addTarget(self, action: #selector(chouseButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc func chouseButtonAction(sender: UIButton) {
        
        let makeOrderVC = BillViewController()
        
        let navController = UINavigationController(rootViewController: makeOrderVC)
        navController.modalPresentationStyle = .pageSheet
        present(navController, animated: true)
    }
}
