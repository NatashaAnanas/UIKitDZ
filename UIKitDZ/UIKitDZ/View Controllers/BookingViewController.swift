//
//  BookingViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 27.09.2022.
//

import UIKit
/// BookingViewController - бронироване дома
class BookingViewController: UIViewController {
    
    private let bookingButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .tertiaryLabel
        button.setTitle("Забронировать", for: .normal)
        button.setTitleColor(UIColor.lightText, for: .highlighted)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите имя"
        return textField
    }()
    
    private let numberTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = "Введите номер"
        return textField
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .black
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .black
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите свои данные"
        label.textAlignment = .center
        label.textColor = .black
        label.layer.cornerRadius = 15
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    var houseImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var nameHouseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 23)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        settingsView()
    }
    
    private func settingsView() {
        
        view.backgroundColor = .groupTableViewBackground
        
        navigationController?.navigationBar.tintColor = .black
        
        bookingButton.addTarget(self, action: #selector(bookingButtonAction(sender: )), for: .touchUpInside)
    }
    
    private func createUI() {
        
        houseImage.frame = CGRect(x: 0, y: 375, width: 370, height: 220)
        houseImage.center.x = view.center.x
        houseImage.backgroundColor = .red
        view.addSubview(houseImage)
        
        infoLabel.frame = CGRect(x: 0, y: 90, width: 260, height: 50)
        infoLabel.center.x = view.center.x
        view.addSubview(infoLabel)
        
        nameLabel.frame = CGRect(x: 45, y: 160, width: 200, height: 40)
        view.addSubview(nameLabel)
        
        numberLabel.frame = CGRect(x: 45, y: 260, width: 200, height: 40)
        view.addSubview(numberLabel)
        
        nameHouseLabel.frame = CGRect(x: 0, y: 600, width: 200, height: 40)
        nameHouseLabel.center.x = view.center.x
        view.addSubview(nameHouseLabel)
        
        nameTextField.frame = CGRect(x: 40, y: 200, width: 350, height: 40)
        view.addSubview(nameTextField)
        
        numberTextField.frame = CGRect(x: 40, y: 300, width: 350, height: 40)
        view.addSubview(numberTextField)
        
        bookingButton.frame = CGRect(x: 0, y: 670, width: 200, height: 70)
        bookingButton.center.x = view.center.x
        view.addSubview(bookingButton)
    }
    
    private func createAlert(title: String, message: String, preferredStyle: UIAlertController.Style) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
    
    @objc private func bookingButtonAction(sender: UIButton) {
        
        let nameText = nameTextField.text ?? ""
        let numberText = numberTextField.text ?? ""
        
        guard nameText.isEmpty || numberText.isEmpty else {
            createAlert(title: "Ваш заказ сформирован",
                        message: "С вами скоро свяжутся представители нашей сомпании",
                        preferredStyle: .alert)
            return
        }
        createAlert(title: "Заполните все поля", message: "", preferredStyle: .alert)
    }
}
