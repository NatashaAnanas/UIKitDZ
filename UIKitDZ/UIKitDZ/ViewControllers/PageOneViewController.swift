//
//  PageOneViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 30.09.2022.
//

import UIKit
/// Страница с кнопкой
class PageOneViewController: UIViewController, UITextFieldDelegate {
    
    let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 75
        return button
    }()
    
    let colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("Color", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        return button
    }()
    
    let sizeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("Size", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        return button
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 27)
        label.numberOfLines = 0
        return label
    }()
    
    let colorPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        return picker
    }()
    
    let numberLinesPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        return picker
    }()
    
    let sizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 64
        slider.minimumTrackTintColor = .green
        return slider
    }()
    
    let colorTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let sizeTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    let colors: [(String, UIColor)] = [("white", UIColor.white),
                                          ("red", UIColor.red),
                                          ("green", UIColor.green),
                                          ("blue", UIColor.blue),
                                          ("yellow", UIColor.yellow),
                                          ("orange", UIColor.orange),
                                          ("black", UIColor.black),
                                          ("purple", UIColor.purple),
                                          ("gray", UIColor.gray)]
    
    let nums = ["0", "1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .systemMint
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(plusButtonAction(sender: )))
        
        startButton.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        startButton.center = view.center
        view.addSubview(startButton)
        
        colorButton.frame = CGRect(x: 70, y: 150, width: 100, height: 100)
        
        sizeButton.frame = CGRect(x: 260, y: 150, width: 100, height: 100)
        
        myLabel.frame = CGRect(x: 0, y: 530, width: 350, height: 200)
        myLabel.center.x = view.center.x
        view.addSubview(myLabel)
        
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
        
        numberLinesPickerView.dataSource = self
        numberLinesPickerView.delegate = self
        
        colorTextField.delegate = self
        colorTextField.inputView = colorPickerView
        colorTextField.isHidden = true
        view.addSubview(colorTextField)
        
        sizeTextField.delegate = self
        sizeTextField.inputView = numberLinesPickerView
        sizeTextField.isHidden = true
        view.addSubview(sizeTextField)
        
        sizeSlider.frame = CGRect(x: 0, y: 300, width: 300, height: 40)
        sizeSlider.center.x = view.center.x
        
        startButton.addTarget(self,
                              action: #selector(startButtonAction(sender: )),
                              for: .touchUpInside)
        
        colorButton.addTarget(self,
                              action: #selector(colorButtonAction(sender: )),
                              for: .touchUpInside)
        
        sizeButton.addTarget(self,
                             action: #selector(sizeButtonAction(sender: )),
                             for: .touchUpInside)
        
        sizeSlider.addTarget(self,
                             action: #selector(sizeSliderAction(sender: )),
                             for: .allEvents)
    }
    
    func alert() {
        
        let alertController = UIAlertController(title: "Введите слово", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "ОК", style: .default) { _ in
            let text = alertController.textFields?.first?.text ?? ""
            
            self.myLabel.text = text
        }
        
        alertController.addTextField()
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
    
    @objc func startButtonAction(sender: UIButton ) {
        view.addSubview(sizeButton)
        view.addSubview(colorButton)
        view.addSubview(sizeSlider)

    }
    
    @objc func plusButtonAction(sender: UIButton ) {
        alert()
    }
    
    @objc func colorButtonAction(sender: UIButton) {
        colorTextField.becomeFirstResponder()
        print("hello")
    }
    
    @objc func sizeButtonAction(sender: UIButton) {
        sizeTextField.becomeFirstResponder()
        print("hello1")
    }
    @objc func sizeSliderAction(sender: UISlider) {
        
        print(1)
        print(sender.value)
        myLabel.font = .systemFont(ofSize: CGFloat(sender.value))
    }
}
