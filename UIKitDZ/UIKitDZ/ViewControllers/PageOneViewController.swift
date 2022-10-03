//
//  PageOneViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 30.09.2022.
//

import UIKit
/// Страница с настройками
final class PageOneViewController: UIViewController, UITextFieldDelegate {
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 75
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        return button
    }()
    
    private let colorButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemYellow
        button.setTitle("Color", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.tertiaryLabel.cgColor
        return button
    }()
    
    private let sizeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitle("Line", for: .normal)
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
    
    private let colorPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        return picker
    }()
    
    private let numberLinesPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        return picker
    }()
    
    private let sizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 64
        slider.minimumTrackTintColor = .green
        return slider
    }()
    
    private let colorTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private let sizeTextField: UITextField = {
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
        createPicker()
    }
    
    private func createUI() {
        
        view.backgroundColor = .systemMint
        
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(plusButtonAction(sender: )))
        // MARK: - Create UIButton
        startButton.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        startButton.center = view.center
        view.addSubview(startButton)
        
        colorButton.frame = CGRect(x: 70, y: 600, width: 100, height: 100)
        
        sizeButton.frame = CGRect(x: 250, y: 600, width: 100, height: 100)
        
        // MARK: - Create UILabel
        myLabel.frame = CGRect(x: 0, y: 70, width: 350, height: 200)
        myLabel.center.x = view.center.x
        view.addSubview(myLabel)
        
        // MARK: - Create UIPickerView
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
        
        numberLinesPickerView.dataSource = self
        numberLinesPickerView.delegate = self
        
        // MARK: - Create UITextField
        colorTextField.delegate = self
        colorTextField.inputView = colorPickerView
        colorTextField.isHidden = true
        view.addSubview(colorTextField)
        
        sizeTextField.delegate = self
        sizeTextField.inputView = numberLinesPickerView
        sizeTextField.isHidden = true
        view.addSubview(sizeTextField)
        
        // MARK: - Create UISlider
        sizeSlider.frame = CGRect(x: 0, y: 310, width: 300, height: 40)
        sizeSlider.center.x = view.center.x
        
        // MARK: - Create Actions
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
    
    // MARK: - Create Alert
    private func alert() {
        
        let alertController = UIAlertController(title: "Введите слово", message: "", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "ОК", style: .default) { _ in
            let text = alertController.textFields?.first?.text ?? ""
            
            self.myLabel.text = text
        }
        
        alertController.addTextField()
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Create UIPickerView
    
    private func createPicker() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = .systemMint
        toolBar.tintColor = .black
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneAction))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
        
        toolBar.setItems([space, doneButton], animated: true)
        
        sizeTextField.inputAccessoryView = toolBar
        colorTextField.inputAccessoryView = toolBar
    }
    
    @objc private func startButtonAction(sender: UIButton ) {
        view.addSubview(sizeButton)
        view.addSubview(colorButton)
        view.addSubview(sizeSlider)
        
    }
    
    @objc private func plusButtonAction(sender: UIButton ) {
        alert()
    }
    
    @objc private func colorButtonAction(sender: UIButton) {
        colorTextField.becomeFirstResponder()
    }
    
    @objc private func sizeButtonAction(sender: UIButton) {
        sizeTextField.becomeFirstResponder()
    }
    
    @objc private func sizeSliderAction(sender: UISlider) {
        myLabel.font = .systemFont(ofSize: CGFloat(sender.value))
    }
    
    @objc private func doneAction() {
        view.endEditing(true)
    }
}
