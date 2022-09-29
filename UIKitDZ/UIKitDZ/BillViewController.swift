//
//  BillViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 28.09.2022.
//

import UIKit
/// BillViewController - контроллер оплаты заказа
final class BillViewController: UIViewController {
    
    private let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ:"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    let pizzaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 27)
        return label
    }()
    
    private let ingeedientsrLabel: UILabel = {
        let label = UILabel()
        label.text = "Ветчина, грибы"
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let cartLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата картой"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    private let cashLabel: UILabel = {
        let label = UILabel()
        label.text = "Оплата наличными"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 23)
        return label
    }()
    
    private let cartSwitch: UISwitch = {
        let sw = UISwitch()
        sw.tag = 0
        return sw
    }()
    
    private let cashSwitch: UISwitch = {
        let sw = UISwitch()
        sw.tag = 1
        return sw
    }()
    
    private let payButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "pay"), for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        return button
    }()
    
    let pizzaImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
    }
    
    private func createUI() {
        title = "Оплата"
        view.backgroundColor = .systemYellow
        navigationController?.navigationBar.tintColor = UIColor.black
        
        pizzaImageView.frame = CGRect(x: 0, y: 260, width: 320, height: 320)
        pizzaImageView.center.x = view.center.x
        view.addSubview(pizzaImageView)
        
        orderLabel.frame = CGRect(x: 40, y: 110, width: 150, height: 40)
        view.addSubview(orderLabel)
        
        pizzaLabel.frame = CGRect(x: 60, y: 160, width: 150, height: 40)
        view.addSubview(pizzaLabel)
        
        ingeedientsrLabel.frame = CGRect(x: 65, y: 190, width: 150, height: 40)
        view.addSubview(ingeedientsrLabel)
        
        cartLabel.frame = CGRect(x: 40, y: 620, width: 200, height: 40)
        view.addSubview(cartLabel)
        
        cashLabel.frame = CGRect(x: 40, y: 675, width: 250, height: 40)
        view.addSubview(cashLabel)
        
        payButton.frame = CGRect(x: 40, y: 750, width: 200, height: 60)
        payButton.center.x = view.center.x
        
        view.addSubview(payButton)
        
        cartSwitch.frame = CGRect(x: 320, y: 620, width: 30, height: 30)
        view.addSubview(cartSwitch)
        
        cashSwitch.frame = CGRect(x: 320, y: 675, width: 30, height: 30)
        view.addSubview(cashSwitch)
        
        payButton.addTarget(self, action: #selector(payButtonAction(sender: )), for: .touchUpInside)
        
        cartSwitch.addTarget(self, action: #selector(paySwitchAction(sender: )), for: .touchUpInside)
        
        cashSwitch.addTarget(self, action: #selector(paySwitchAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func paySwitchAction(sender: UISwitch) {
        
        switch sender.tag {
        case 0:
            cartSwitch.setOn(true, animated: true)
            cashSwitch.setOn(false, animated: true)
        case 1:
            cartSwitch.setOn(false, animated: true)
            cashSwitch.setOn(true, animated: true)
        default:
            break
        }
    }
    
    @objc private func payButtonAction(sender: UIButton) {
        
        let message = """
    Скоро ваш заказ доставят
      Приятного аппетита!
    """
        
        guard cartSwitch.isOn || cashSwitch.isOn else { return }
        
        let alertController = UIAlertController(title: "Заказ оплачен",
                                                message: message,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            
            let feedbackVC = FeedbackViewController()
            
            let navControlle = UINavigationController(rootViewController: feedbackVC)
            navControlle.modalPresentationStyle = .fullScreen
            self.present(navControlle, animated: true)
        }
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
}
