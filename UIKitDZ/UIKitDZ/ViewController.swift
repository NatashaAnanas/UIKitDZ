//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class ViewController: UIViewController {
    
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
    
    let labelHello = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 25))
    let labelForAddiction = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 20))
    let labelForGuess = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 18))
    let labelForRevers = UILabel(numberOfLines: 0, textColor: .white, font: .systemFont(ofSize: 20))
    
    @IBOutlet weak var anasasImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .tertiaryLabel
        
        createButtons()
        createLabels()
        
        addictionButton.addTarget(self, action: #selector(addictionButtonAction(sender: )), for: .touchUpInside)
        guessNumberButton.addTarget(self, action: #selector(guessNumberButtonAction(sender: )), for: .touchUpInside)
        reversedWordButton.addTarget(self, action: #selector(reverseActionButton(sender:)), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createAlert()
    }
    
    func createButtons () {
        
        addictionButton.frame = CGRect(x: 60, y: 190, width: 300, height: 100)
        view.addSubview(addictionButton)
        
        guessNumberButton.frame = CGRect(x: 60, y: 370, width: 300, height: 100)
        view.addSubview(guessNumberButton)
        
        reversedWordButton.frame = CGRect(x: 60, y: 550, width: 300, height: 100)
        view.addSubview(reversedWordButton)
    }
    
    func createAlert () {
        
        let alertController = UIAlertController(title: "Привет!", message: "Введи свое имя", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .cancel) {_ in
            
            let nameOfUser = alertController.textFields?.first?.text

            if let nameUser = nameOfUser, nameUser.count > 0 {
                self.labelHello.text = "Привет, \(nameUser.capitalized)!"
            } else {
                self.labelHello.text = "Привет, Игрок!"
            }
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true)
        alertController.addTextField()
    }
    
    func createLabels () {
        
        labelHello.frame = CGRect(x: 0, y: 95, width: 200, height: 60)
        labelHello.center.x = self.view.center.x
        view.addSubview(labelHello)
        
        labelForAddiction.frame = CGRect(x: 70, y: 300, width: 200, height: 60)
        view.addSubview(labelForAddiction)
        
        labelForGuess.frame = CGRect(x: 70, y: 470, width: 250, height: 80)
        view.addSubview(labelForGuess)
        
        labelForRevers.frame = CGRect(x: 70, y: 640, width: 250, height: 80)
        view.addSubview(labelForRevers)
    }
    
    @objc func addictionButtonAction (sender: UIButton) {
        
        let alertControllerforButton = UIAlertController(
            title: "СЛОЖЕНИЕ",
            message: "Введи числа ",
            preferredStyle: .alert)
        
        let alertActionforButton = UIAlertAction(
            title: "Реши", style: .cancel, handler: { _ in
                let firstTextField = alertControllerforButton.textFields?.first?.text ?? "0"
                let secondTextField = alertControllerforButton.textFields?.last?.text ?? "0"

                let firstTextFieldInt = Int(firstTextField) ?? 0
                let secondTextFieldInt = Int(secondTextField) ?? 0
                
                self.labelForAddiction.text = "Ответ: \(firstTextFieldInt + secondTextFieldInt))"
            })
        
        alertControllerforButton.addTextField()
        alertControllerforButton.addTextField()
        
        alertControllerforButton.textFields?.first?.placeholder = "0"
        alertControllerforButton.textFields?[1].placeholder = "0"
        alertControllerforButton.addAction(alertActionforButton)
        present(alertControllerforButton, animated: true)
    }
    
    @objc func guessNumberButtonAction (sender: UIButton) {
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
                self.labelForGuess.text = "Верно! Я загадал число \(value)"
            } else {
                self.labelForGuess.text = "Неверно! Я загадал число \(value)"
            }
        })
        
        alertControllerForGuess.addAction(alertControlerActionForGuess)
        present(alertControllerForGuess, animated: true)
    }
    
    @objc func reverseActionButton (sender: UIButton) {
        let alertControllerReverse = UIAlertController(
            title: "СЛОВО НАОБОРОТ",
            message: "Введите слово",
            preferredStyle: .alert
        )
        alertControllerReverse.addTextField()
        
        let alertControllerActionReverse = UIAlertAction(title: "Перевернуть", style: .cancel, handler: { _ in
            var word = alertControllerReverse.textFields?.first?.text ?? "пусто"
            word = String(word.reversed())
            
            self.labelForRevers.text = "Перевёртыш: \(String(word.capitalized))"
        })
        alertControllerReverse.addAction(alertControllerActionReverse)
        present(alertControllerReverse, animated: true)
        
    }
}
