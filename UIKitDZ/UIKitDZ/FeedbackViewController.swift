//
//  FeedbackViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 29.09.2022.
//

import UIKit
/// FeedbackViewController - контролер для отзыва клиента
final class FeedbackViewController: UIViewController {
    
    private let feedbackTextView: UITextView = {
        let text = UITextView()
        text.font = .systemFont(ofSize: 20)
        text.backgroundColor = .systemYellow
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.cornerRadius = 20
        return text
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setTitle( "Отправить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let feedbackLabel: UILabel = {
        let label = UILabel()
        label.text = "Напишите ваш отзыв:"
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 30)
        return label
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
        
        pizzaImageView.frame = CGRect(x: 0, y: 550, width: 320, height: 250)
        pizzaImageView.center.x = view.center.x
        view.addSubview(pizzaImageView)
        
        feedbackTextView.frame = CGRect(x: 0, y: 200, width: 300, height: 200)
        feedbackTextView.center.x = view.center.x
        view.addSubview(feedbackTextView)
        
        sendButton.frame = CGRect(x: 0, y: 450, width: 250, height: 50)
        sendButton.center.x = view.center.x
        view.addSubview(sendButton)
        
        feedbackLabel.frame = CGRect(x: 0, y: 120, width: 300, height: 50)
        feedbackLabel.center.x = view.center.x
        view.addSubview(feedbackLabel)
        
        sendButton.addTarget(self, action: #selector(sendButtonAction(sender: )), for: .touchUpInside)
    }

    @objc private func sendButtonAction(sender: UIButton) {
        
        let message = "Мы становимся лучше, благодаря Вам!"
        
        let alertController = UIAlertController(title: "Спасибо за ваш отзыв!",
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
