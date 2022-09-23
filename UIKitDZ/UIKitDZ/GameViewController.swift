//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// GameViewController - экран с играми
final class GameViewController: UIViewController {
    
    let addictionButton = UIButton(
        titel: "Сложить",
        backgroundColor: UIColor.systemPink.cgColor,
        cornerRadius: 50,
        borderColor: UIColor.purple.cgColor,
        borderWidth: 5)
    
    let guessNumberButton = UIButton(
        titel: "Угадай число", backgroundColor: UIColor.systemBlue.cgColor,
        cornerRadius: 50,
        borderColor: UIColor.systemYellow.cgColor,
        borderWidth: 5)
    
    let reversedWordButton = UIButton(
        titel: "Слово наоборот",
        backgroundColor: UIColor.purple.cgColor,
        cornerRadius: 50,
        borderColor: UIColor.green.cgColor,
        borderWidth: 5)
    
    let helloLabel = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 25))
    let addictionLabel = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 20))
    let guessLabel = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 18))
    let reversLabel = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .tertiaryLabel
        
        createButtons()
        createLabels()
        
        addictionButton.addTarget(self, action: #selector(addictionButtonAction(sender: )), for: .touchUpInside)
        guessNumberButton.addTarget(self, action: #selector(guessNumberButtonAction(sender: )), for: .touchUpInside)
        reversedWordButton.addTarget(self, action: #selector(reverseButtonAction(sender:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        createAlert()
    }
    
    func createButtons() {
        
        addictionButton.frame = CGRect(x: 60, y: 190, width: 300, height: 100)
        view.addSubview(addictionButton)
        
        guessNumberButton.frame = CGRect(x: 60, y: 370, width: 300, height: 100)
        view.addSubview(guessNumberButton)
        
        reversedWordButton.frame = CGRect(x: 60, y: 550, width: 300, height: 100)
        view.addSubview(reversedWordButton)
    }
    
    func createAlert() {
        
        let alertController = UIAlertController(title: "Привет!", message: "Введи свое имя", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .cancel) {_ in
            
            let nameOfUser = alertController.textFields?.first?.text

            if let nameUser = nameOfUser, nameUser.count > 0 {
                self.helloLabel.text = "Привет, \(nameUser.capitalized)!"
            } else {
                self.helloLabel.text = "Привет, Игрок!"
            }
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        alertController.addTextField()
    }
    
    func createLabels() {
        
        helloLabel.frame = CGRect(x: 0, y: 95, width: 200, height: 60)
        helloLabel.center.x = self.view.center.x
        view.addSubview(helloLabel)
        
        addictionLabel.frame = CGRect(x: 70, y: 300, width: 200, height: 60)
        view.addSubview(addictionLabel)
        
        guessLabel.frame = CGRect(x: 70, y: 470, width: 250, height: 80)
        view.addSubview(guessLabel)
        
        reversLabel.frame = CGRect(x: 70, y: 640, width: 250, height: 80)
        view.addSubview(reversLabel)
    }
    
    @objc func addictionButtonAction(sender: UIButton) {
        
        let alertController = UIAlertController(
            title: "СЛОЖЕНИЕ",
            message: "Введи числа ",
            preferredStyle: .alert)
        
        let alertAction = UIAlertAction(
            title: "Реши", style: .cancel, handler: { _ in
                let firstTextField = alertController.textFields?.first?.text ?? "0"
                let secondTextField = alertController.textFields?.last?.text ?? "0"

                let firstTextFieldInt = Int(firstTextField) ?? 0
                let secondTextFieldInt = Int(secondTextField) ?? 0
                
                self.addictionLabel.text = "Ответ: \(firstTextFieldInt + secondTextFieldInt))"
            })
        
        alertController.addTextField()
        alertController.addTextField()
        
        alertController.textFields?.first?.placeholder = "0"
        alertController.textFields?[1].placeholder = "0"
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @objc func guessNumberButtonAction(sender: UIButton) {
        let alertControllerForGuess = UIAlertController(
            title: "УГАДАЙ ЧИСЛО",
            message: "Я загадал число от 1 до 5",
            preferredStyle: .alert)
        alertControllerForGuess.addTextField()
        alertControllerForGuess.textFields?.first?.placeholder = "Введите число"
        
        let alertControlerActionForGuess = UIAlertAction(title: "Проверить", style: .cancel, handler: { _ in
            let value = Int.random(in: 1...5)
            let number = Int(alertControllerForGuess.textFields?.first?.text ?? "0")
            
            if value == number {
                self.guessLabel.text = "Верно! Я загадал число \(value)"
            } else {
                self.guessLabel.text = "Неверно! Я загадал число \(value)"
            }
        })
        
        alertControllerForGuess.addAction(alertControlerActionForGuess)
        present(alertControllerForGuess, animated: true)
    }
    
    @objc func reverseButtonAction (sender: UIButton) {
        let alertControllerReverse = UIAlertController(
            title: "СЛОВО НАОБОРОТ",
            message: "Введите слово",
            preferredStyle: .alert
        )
        alertControllerReverse.addTextField()
        
        let alertControllerActionReverse = UIAlertAction(title: "Перевернуть", style: .cancel, handler: { _ in
            var word = alertControllerReverse.textFields?.first?.text ?? "пусто"
            word = String(word.reversed())
            
            self.reversLabel.text = "Перевёртыш: \(String(word.capitalized))"
        })
        alertControllerReverse.addAction(alertControllerActionReverse)
        present(alertControllerReverse, animated: true)
        
    }
}
