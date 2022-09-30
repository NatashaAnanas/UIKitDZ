//
//  PageOneViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 30.09.2022.
//

import UIKit
/// Страница с кнопкой
class PageOneViewController: UIViewController {
    
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
        return slider
    }()
    
    let colors = ["white", "red", "green", "blue", "yellow", "orange", "black", "purple", "gray"]
    
    let nums = ["0", "1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .systemMint
        
        //        navigationItem.rightBarButtonItem?.buttonGroup.
        
        startButton.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        startButton.center = view.center
        view.addSubview(startButton)
        
        colorButton.frame = CGRect(x: 70, y: 150, width: 100, height: 100)
        view.addSubview(colorButton)
        
        sizeButton.frame = CGRect(x: 260, y: 150, width: 100, height: 100)
        view.addSubview(sizeButton)
        
        myLabel.frame = CGRect(x: 0, y: 530, width: 350, height: 130)
        myLabel.center.x = view.center.x
        view.addSubview(myLabel)
        
        startButton.addTarget(self,
                              action: #selector(plusButtonAction(sender: )),
                              for: .touchUpInside)
        
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
        
        numberLinesPickerView.dataSource = self
        numberLinesPickerView.delegate = self
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
    
    @objc func plusButtonAction(sender: UIButton ) {
        alert()
    }
}
