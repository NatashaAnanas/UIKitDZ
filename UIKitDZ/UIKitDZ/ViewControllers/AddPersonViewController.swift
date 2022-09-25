//
//  AddPersonViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 23.09.2022.
//

import UIKit
/// AddPersonViewController - добавить инфу о новом человеке
final class AddPersonViewController: UIViewController, UITextFieldDelegate {
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let ageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let genderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let instagramTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "me")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 75
        imageView.layer.borderColor = UIColor.systemIndigo.cgColor
        imageView.layer.borderWidth = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemIndigo
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemIndigo
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemIndigo
        return label
    }()
    
    let sexLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemIndigo
        return label
    }()
    
    let instagramLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemIndigo
        return label
    }()
    
    let changePhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Изменить фото"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemIndigo
        return label
    }()
    
    let genderPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        return picker
    }()
    
    let dataPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let agePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        return picker
    }()
    
    let gender = ["Мужской", "Женский"]
    
    var infoUsers = InfoUsers()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView()
        createUI()
        createPicker()
        createDatePicker()
        addAction()
    }
    
    private func addAction() {
        
        instagramTextField.addTarget(self,
                                     action: #selector(instagramTextFieldAction(sender: )),
                                     for: .allEditingEvents)
    }
    
    @objc private func instagramTextFieldAction(sender: UITextField) {
        
        let alertController = UIAlertController(title: "", message: "Введите свой Instagram", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
            
            let text = alertController.textFields?.first?.text ?? ""
            self.instagramTextField.text = text
        }
        let alertCancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addTextField()
        alertController.textFields?.first?.placeholder = "natasha_ananas"
        
        alertController.addAction(alertAction)
        alertController.addAction(alertCancelAction)
        
        present(alertController, animated: true)
    }
    
    private func createUI() {
        
        // MARK: - UIButton
        
        // MARK: - UILabel
        nameLabel.frame = CGRect(x: 50, y: 300, width: 100, height: 40)
        view.addSubview(nameLabel)
        
        dateLabel.frame = CGRect(x: 50, y: 400, width: 100, height: 40)
        view.addSubview(dateLabel)
        
        ageLabel.frame = CGRect(x: 50, y: 500, width: 100, height: 40)
        view.addSubview(ageLabel)
        
        sexLabel.frame = CGRect(x: 50, y: 600, width: 100, height: 40)
        view.addSubview(sexLabel)
        
        instagramLabel.frame = CGRect(x: 50, y: 700, width: 100, height: 40)
        view.addSubview(instagramLabel)
        
        changePhotoLabel.frame = CGRect(x: 0, y: 250, width: 150, height: 35)
        changePhotoLabel.center.x = view.center.x
        view.addSubview(changePhotoLabel)
        
        // MARK: - UITextField
        
        nameTextField.frame = CGRect(x: 40, y: 350, width: 330, height: 40)
        view.addSubview(nameTextField)
        
        dateTextField.frame = CGRect(x: 40, y: 450, width: 330, height: 40)
        dateTextField.inputView = dataPicker
        view.addSubview(dateTextField)
        
        ageTextField.frame = CGRect(x: 40, y: 550, width: 330, height: 40)
        ageTextField.inputView = agePicker
        view.addSubview(ageTextField)
        
        genderTextField.frame = CGRect(x: 40, y: 650, width: 330, height: 40)
        genderTextField.inputView = genderPicker
        view.addSubview(genderTextField)
        
        instagramTextField.frame = CGRect(x: 40, y: 750, width: 330, height: 40)
        instagramTextField.delegate = self
        view.addSubview(instagramTextField)
        
        // MARK: - UIImageView
        
        iconImageView.frame = CGRect(x: 0, y: 100, width: 150, height: 150)
        iconImageView.center.x = view.center.x
        view.addSubview(iconImageView)
        
        // MARK: - UITextFieldDelegate UITextFieldDataSourse
        
        agePicker.delegate = self
        genderPicker.delegate = self
        
        agePicker.dataSource = self
        genderPicker.dataSource = self
        
    }
        // MARK: - Create UIPickerView
        
        private func createPicker() {
            
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(doneAction))
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            toolBar.setItems([space, doneButton], animated: true)
            
            ageTextField.inputAccessoryView = toolBar
            genderTextField.inputAccessoryView = toolBar
            
        }
        
        // MARK: - Create UIDatePicker
        
        private func createDatePicker() {
            
            let toolBar = UIToolbar()
            toolBar.sizeToFit()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(doneDateAction))
            
            let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            toolBar.setItems([space, doneButton], animated: true)
            
            dateTextField.inputAccessoryView = toolBar
        }
    
    @objc private func doneDateAction() {
        getDateFromPicker()
        self.view.endEditing(true)
    }
    
    private func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MMMM.yyyy"
        dateTextField.text = formatter.string(from: dataPicker.date)
    }
    
    @objc private func doneAction() {
        self.view.endEditing(true)
    }
    
    // MARK: - Create Settings View
    
    private func settingsView() {
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(actionAdd(sender: )))
    }
    
    @objc private func actionAdd(sender: UIBarButtonItem) {
        
        if (nameTextField.text?.isEmpty == false),
           (dateTextField.text?.isEmpty == false),
           (ageTextField.text?.isEmpty == false) {
            infoUsers.info.updateValue((name: nameTextField.text ?? "",
                                        dateBirthday: dateTextField.text ?? "",
                                        age: ageTextField.text ?? ""),
                                       forKey: 1)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if let infoListVC = storyboard.instantiateViewController(withIdentifier: "vc2") as? InfoListViewController {
                
                let age = infoUsers.info[infoUsers.info.count]?.age
                let ageNew = (Int(age ?? "0") ?? 0) + 1
                
                let arrayDate = infoUsers.info[infoUsers.info.count]?.dateBirthday.components(separatedBy: ".")
                
                let day = arrayDate?[0] ?? ""
                let month = arrayDate?[1] ?? ""
                
                let time = NSDate()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MMM"
                formatter.timeZone = TimeZone(secondsFromGMT: 0)
                
                let formatteddate = formatter.string(from: time as Date)
                print(formatteddate)
                
                infoListVC.addImage.image = UIImage(named: "me")
                infoListVC.addImage.layer.cornerRadius = 35
                infoListVC.addImage.layer.borderColor = UIColor.systemIndigo.cgColor
                infoListVC.addImage.layer.borderWidth = 2
                infoListVC.addNameLabel.text = infoUsers.info[infoUsers.info.count]?.name
                infoListVC.addInfoLabel.text = "\(day) \(month), иполнится \(ageNew) лет"
                infoListVC.addDayLabel.text = "248 дней"

                show(infoListVC, sender: nil)
            }
        }
    }
}
