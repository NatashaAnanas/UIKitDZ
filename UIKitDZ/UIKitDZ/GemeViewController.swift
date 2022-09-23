//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// GemeViewController - экран с кнопкой
final class GemeViewController: UIViewController {
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.textColor = .yellow
        label.font = .systemFont(ofSize: 40)
        label.numberOfLines = 0 
        return label
    }()
    
    let helloButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        button.setTitle("Начать", for: .normal)
        button.isHighlighted = true
        button.setTitleColor(UIColor.purple, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.layer.cornerRadius = 100
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 10
        return button
    }()
    
    let storage = Storage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSettings()
        createButton()
        createLabel()
        createAction()
    }
    
    func viewSettings() {
        self.view.backgroundColor = .black
    }
    
    func createAction() {
        helloButton.addTarget(self, action: #selector(helloButtonAction(sender: )), for: .touchUpInside)
    }
    
    func createButton() {
        helloButton.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        helloButton.center = view.center
        view.addSubview(helloButton)
    }
    
    func createLabel() {
        helloLabel.frame = CGRect(x: 0, y: 250, width: 150, height: 50)
        helloLabel.center.x = view.center.x
        view.addSubview(helloLabel)
    }
    
    @objc func helloButtonAction(sender: UIButton) {
        
        let alertController = UIAlertController(
            title: "Привет! ✌🏻",
            message: "Введи слово",
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(
            title: "Отправить",
            style: .default
        ) { _ in
            let text = alertController.textFields?.first?.text ?? ""
            if text == "leohl" {
                self.helloLabel.text = self.storage.hello
            } else {
                self.helloLabel.text = String(text.reversed())
            }
        }
        
        alertController.addTextField()
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
