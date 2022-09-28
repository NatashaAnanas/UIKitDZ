//
//  BillViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// BillViewController - контроллер оплаты
class BillViewController: UIViewController {

    let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 22)
        return label
    }()
    
    let pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Pizza"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 27)
        return label
    }()
    
    let ingeedientsrLabel: UILabel = {
        let label = UILabel()
        label.text = "Грибы, сыр"
        label.textAlignment = .left
        label.textColor = .tertiaryLabel
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let cartLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата картой"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    let cashLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата наличными"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    let cartSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    let cashSwitch: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    let payButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pay", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .orange
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    func createUI() {
        title = "Оплата"
        view.backgroundColor = .systemYellow
        
        orderLabel.frame = CGRect(x: 40, y: 100, width: 150, height: 40)
        view.addSubview(orderLabel)
        
        pizzaLabel.frame = CGRect(x: 40, y: 170, width: 150, height: 40)
        view.addSubview(pizzaLabel)

        ingeedientsrLabel.frame = CGRect(x: 40, y: 200, width: 150, height: 40)
        view.addSubview(ingeedientsrLabel)

        cartLabel.frame = CGRect(x: 40, y: 600, width: 200, height: 40)
        view.addSubview(cartLabel)
        
        cashLabel.frame = CGRect(x: 40, y: 650, width: 250, height: 40)
        view.addSubview(cashLabel)

        payButton.frame = CGRect(x: 40, y: 730, width: 300, height: 60)
        payButton.center.x = view.center.x
        
        view.addSubview(payButton)
        
        cartSwitch.frame = CGRect(x: 320, y: 600, width: 30, height: 30)
        view.addSubview(cartSwitch)
        
        cashSwitch.frame = CGRect(x: 320, y: 650, width: 30, height: 30)
        view.addSubview(cashSwitch)
        
        payButton.addTarget(self, action: #selector(payButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc func payButtonAction(sender: UIButton) {
        
        let message = """
Скоро ваш заказ доставят
Приятного аппетита
"""
        
        let alertController = UIAlertController(title: "Заказ оплачен",
                                                message: message,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            let chouseVC = ChouseViewController()
            
            let navControlle = UINavigationController(rootViewController: chouseVC)
            navControlle.modalPresentationStyle = .fullScreen
            self.present(navControlle, animated: true)
        }
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}
