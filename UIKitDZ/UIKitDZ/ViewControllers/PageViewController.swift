//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// ViewController
class PageViewController: UIViewController, UITextFieldDelegate {
    
    private enum Constant {
        static let textBook = """
Все счастливые семьи похожи друг на друга, каждая несчастливая семья несчастлива по-своему.
Все смешалось в доме Облонских. Жена узнала, что муж был в связи с бывшею в их доме
 француженкою-гувернанткой, и объявила мужу, что не может жить с ним в одном доме.
 Положение это продолжалось уже третий день и мучительно чувствовалось и самими супругами,
 и всеми членами семьи, и домочадцами. Все члены семьи и домочадцы чувствовали,
 что нет смысла в их сожительстве и что на каждом постоялом дворе случайно
 сошедшиеся люди более связаны между собой, чем они, члены семьи и домочадцы Облонских.
 Жена не выходила из своих комнат, мужа третий день не было дома.
 Дети бегали по всему дому, как потерянные;
англичанка поссорилась с экономкой и написала записку приятельнице,
прося приискать ей новое место; повар ушел вчера со двора,
во время самого обеда; черная кухарка и кучер просили расчета.
На третий день после ссоры князь Степан Аркадьич Облонский — Стива,
как его звали в свете, — в обычный час, то есть в восемь часов утра,
 проснулся не в спальне жены, а в своем кабинете, на сафьянном диване.
 Он повернул свое полное, выхоленное тело на пружинах дивана,
как бы желая опять заснуть надолго, с другой стороны крепко обнял подушку
 и прижался к ней щекой; но вдруг вскочил, сел на диван и открыл глаза.
«Да, да, как это было? — думал он, вспоминая сон. — Да, как это было?
 Да! Алабин давал обед в Дармштадте; нет, не в Дармштадте, а что-то американское.
 Да, но там Дармштадт был в Америке. Да, Алабин давал обед на стеклянных столах,
 да, — и столы пели: Il mio tesoro 1 и не Il mio tesoro, а что-то лучше,
 и какие-то маленькие графинчики, и они же женщины», — вспоминал он.
Глаза Степана Аркадьича весело заблестели, и он задумался, улыбаясь.
 «Да, хорошо было, очень хорошо. Много еще что-то там было отличного,
да не скажешь словами и мыслями даже наяву не выразишь».
И, заметив полосу света, пробившуюся сбоку одной из суконных стор,
 он весело скинул ноги с дивана, отыскал ими шитые женой
(подарок ко дню рождения в прошлом году), обделанные в золотистый сафьян туфли,
 и по старой, девятилетней привычке, не вставая, потянулся рукой к тому месту,
 где в спальне у него висел халат. И тут он вспомнил вдруг, как и почему он спит
 не в спальне жены, а в кабинете; улыбка исчезла с его лица, он сморщил лоб.
"""
    }
    // MARK: - Private Property
    
    private let sizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 22
        slider.maximumValue = 64
        slider.minimumTrackTintColor = .blue
        return slider
    }()
    
    private let fontButton: UIButton = {
        let button = UIButton()
        button.setTitle("A", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        return button
    }()
    
    private let backgroundPageSwitch: UISwitch = {
        let swit = UISwitch()
        swit.setOn(false, animated: true)
        return swit
    }()
    
    private let styleTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Шрифт", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.cornerRadius = 35
        button.backgroundColor = .systemMint
        return button
    }()
    
    private let backgroundPageTextField: UITextField = {
        let text = UITextField()
        return text
    }()
    
    private let darkTextColortButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .blue
        button.tag = 0
        return button
    }()
    
    private let mintTextColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemMint
        button.tag = 1
        return button
    }()
    
    private let tertiaryTextColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .tertiaryLabel
        button.tag = 2
        return button
    }()
    
    private let orangeTextColorButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .orange
        button.tag = 3
        return button
    }()
    
    private let colorTextButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .black
        return button
    }()
    
    private let backgroundPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let text: UITextView = {
        let text = UITextView()
        text.textColor = .darkText
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    
    // MARK: - Public Property
    
    let styles = [ "Arial", "Georgia", "Verdana", "Impact", "Avenir-Light"]

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Private Methods
    private func createUI() {
        
        view.backgroundColor = .white
        
        text.text = Constant.textBook
        
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
    
    @objc private func styleTextButtonAction(sender: UIButton) {
        backgroundPageTextField.becomeFirstResponder()
    }
    
    @objc private func textColorButtonAction(sender: UIButton) {
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
    
    @objc private func backgroundPageSwitchAction(sender: UISwitch) {
        
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
    
    @objc private func fontButtonAction(sender: UIButton) {
        
        let size = text.font?.pointSize ?? 20
        
        if fontButton.titleLabel?.text == "A" {
            text.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 0.8))
            fontButton.setTitle("a", for: .normal)
        } else {
            text.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight(rawValue: 0.2))
            fontButton.setTitle("A", for: .normal)
        }
    }
    
    @objc private func sizeSliderAction(sender: UISlider) {
        text.font = .systemFont(ofSize: CGFloat(sizeSlider.value))
    }
}
