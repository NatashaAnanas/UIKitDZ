//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class ViewController: UIViewController, UITextFieldDelegate {
    
    let sizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 22
        slider.maximumValue = 64
        slider.minimumTrackTintColor = .blue
        return slider
    }()
    
    let text: UITextView = {
        let text = UITextView()
        text.textColor = .darkText
        text.font = .systemFont(ofSize: 20)
        text.text = "Hello Natasha"
        return text
    }()
    
    let fontButton: UIButton = {
        let button = UIButton()
        button.setTitle("A", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        return button
    }()
    
    let backgroundPageSwitch: UISwitch = {
        let swit = UISwitch()
        swit.setOn(false, animated: true)
        return swit
    }()
    
    let styleTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Шрифт", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 35
        button.backgroundColor = .systemMint
        return button
    }()
    
    let backgroundPageTextField: UITextField = {
        let text = UITextField()
        return text
    }()
    
    let backgroundPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let darkTextColortButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        button.tag = 0
        return button
    }()
    
    let mintTextColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemMint
        button.tag = 1
        return button
    }()
    
    let tertiaryTextColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .tertiaryLabel
        button.tag = 2
        return button
    }()
    
    let orangeTextColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.tag = 3
        return button
    }()
    
    let colorTextButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .black
        return button
    }()
    
    let styles = [ "Arial", "Georgia", "Verdana", "Impact", "Avenir-Light"]

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    func createFont() {
//        let font = UIFont.systemFont(ofSize: 20, weight: 0.9)
    }
    
    private func createUI() {
        
        view.backgroundColor = .white
        
        backgroundPageTextField.delegate = self
        backgroundPageTextField.inputView = backgroundPickerView
        backgroundPageTextField.isHidden = true
        view.addSubview(backgroundPageTextField)
        
        backgroundPickerView.dataSource = self
        backgroundPickerView.delegate = self
        
        orangeTextColorButton.frame = CGRect(x: 110, y: 750, width: 40, height: 40)
        view.addSubview(orangeTextColorButton)
        
        mintTextColorButton.frame = CGRect(x: 160, y: 750, width: 40, height: 40)
        view.addSubview(mintTextColorButton)
        
        darkTextColortButton.frame = CGRect(x: 210, y: 750, width: 40, height: 40)
        view.addSubview(darkTextColortButton)
        
        tertiaryTextColorButton.frame = CGRect(x: 260, y: 750, width: 40, height: 40)
        view.addSubview(tertiaryTextColorButton)
        
        fontButton.frame = CGRect(x: 0, y: 620, width: 70, height: 70)
        fontButton.center.x = view.center.x
        fontButton.titleLabel?.textColor = .black
        view.addSubview(fontButton)
        
        styleTextButton.frame = CGRect(x: 40, y: 620, width: 70, height: 70)
        view.addSubview(styleTextButton)
        
        backgroundPageSwitch.frame = CGRect(x: 330, y: 50, width: 40, height: 40)
        view.addSubview(backgroundPageSwitch)
        
        text.frame = CGRect(x: 0, y: 100, width: 350, height: 500)
        text.center.x = view.center.x
        view.addSubview(text)
        
        sizeSlider.frame = CGRect(x: 0, y: 700, width: 300, height: 40)
        sizeSlider.center.x = view.center.x
        view.addSubview(sizeSlider)
        
        sizeSlider.addTarget(self,
                             action: #selector(sizeSliderAction(sender: )),
                             for: .touchUpInside)
        
        fontButton.addTarget(self,
                         action: #selector(fontButtonAction(sender: )),
                         for: .touchUpInside)
        
        backgroundPageSwitch.addTarget(self,
                                       action: #selector(backgroundPageSwitchAction(sender: )),
                                       for: .valueChanged)
        
        orangeTextColorButton.addTarget(self,
                                        action: #selector(textColorButtonAction(sender: )),
                                        for: .touchUpInside)
        
        tertiaryTextColorButton.addTarget(self,
                                        action: #selector(textColorButtonAction(sender: )),
                                        for: .touchUpInside)
        
        mintTextColorButton.addTarget(self,
                                        action: #selector(textColorButtonAction(sender: )),
                                        for: .touchUpInside)
        
        darkTextColortButton.addTarget(self,
                                        action: #selector(textColorButtonAction(sender: )),
                                        for: .touchUpInside)
        
        styleTextButton.addTarget(self, action: #selector(styleTextButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc func styleTextButtonAction(sender: UIButton) {
        backgroundPageTextField.becomeFirstResponder()
    }
//    label.font = UIFont(name: "Avenir-Light", size: 15.0)
    
    @objc func textColorButtonAction(sender: UIButton) {
        switch sender.tag {
        case 0:
            text.textColor = .blue
        case 1:
            text.textColor = .systemMint
        case 2:
            text.textColor = .tertiaryLabel
        case 3:
            text.textColor = .orange
        default:
            break
        }
    }
    
    @objc func backgroundPageSwitchAction(sender: UISwitch) {
        
        if backgroundPageSwitch.isOn {
            text.backgroundColor = .darkText
            text.textColor = .white
            view.backgroundColor = .darkText
            fontButton.setTitleColor(UIColor.white, for: .normal)
        } else {
            text.backgroundColor = .lightText
            text.textColor = .darkText
            view.backgroundColor = .white
            fontButton.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    @objc func fontButtonAction(sender: UIButton) {
        
        let size = text.font?.pointSize ?? 20
        
        if fontButton.titleLabel?.text == "A" {
            text.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 0.8))
            fontButton.setTitle("a", for: .normal)
        } else {
            text.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 0.2))
            fontButton.setTitle("A", for: .normal)
        }
        
//        "Arial" "Georgia" "Verdana" "Impact" "Avenir-Light"
//        fontButton.titleLabel.font = UIFont(name: "Avenir-Light", size: 15.0)
    }
    
    @objc func sizeSliderAction(sender: UISlider) {
        
        text.font = .systemFont(ofSize: CGFloat(sizeSlider.value))
    }
}

extension UIFont {
    
}
