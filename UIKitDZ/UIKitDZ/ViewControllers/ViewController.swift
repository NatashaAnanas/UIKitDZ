//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//
//
import UIKit
/// HouseViewController - контроллер выбора домов
class HouseViewController: UIViewController {
    
    private let chouseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Выбрать", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 25
        button.contentMode = .center
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .tertiaryLabel
        return button
    }()
    
    private let imageViewRoom: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let imageArray = [UIImage(named: "дом1"),
                      UIImage(named: "дом2"),
                      UIImage(named: "дом3")]
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 27)
        label.textColor = .black
        label.contentMode = .center
        label.text = "Выберите объект"
        
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "HOUSE"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.contentMode = .center
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let text = UITextView()
        text.backgroundColor = .groupTableViewBackground
        text.textColor = .black
        text.contentMode = .center
        text.isEditable = false
        text.isSelectable = false
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    
    private let nameHouseArray = ["Forest Residence", "Aura Haus", "Ultra Park"]
    
//    private let descriptText = Description()
    
    private var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        settingsView()
    }
    
    private func settingsView() {
        
        view.backgroundColor = .groupTableViewBackground
        tabBarController?.title = "Life Deluxe"
    }
    
    private func createUI() {
        
        chouseButton.frame = CGRect(x: 0, y: 685, width: 170, height: 50)
        chouseButton.center.x = view.center.x
        chouseButton.addTarget(self, action: #selector(chouseButtonAction(sender: )), for: .touchUpInside)
        
        nameLabel.frame = CGRect(x: 0, y: 100, width: 110, height: 50)
        nameLabel.center.x = view.center.x
        view.addSubview(nameLabel)
        
        segmentedControl = UISegmentedControl(items: nameHouseArray)
        segmentedControl.frame = CGRect(x: 0, y: 750, width: 350, height: 50)
        segmentedControl.center.x = view.center.x
        segmentedControl.backgroundColor = .lightText
        view.addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: #selector(selectedValue(target: )), for: .valueChanged)
        
        imageViewRoom.frame = CGRect(x: 0, y: 160, width: 370, height: 220)
        imageViewRoom.center.x = view.center.x
        view.addSubview(imageViewRoom)
        
        descriptionTextView.frame = CGRect(x: 0, y: 410, width: 350, height: 250)
        descriptionTextView.center.x = view.center.x
        view.addSubview(descriptionTextView)
        
        textLabel.frame = CGRect(x: 0, y: 0, width: 220, height: 50)
        textLabel.center = view.center
        view.addSubview(textLabel)
    }
    
    @objc private func selectedValue(target: UISegmentedControl) {
        
            view.addSubview(chouseButton)
            
            textLabel.text = ""
        
            let segmentIndex = segmentedControl.selectedSegmentIndex
            imageViewRoom.image = imageArray[segmentIndex]
            descriptionTextView.text = descriptText.descriptionHouseArray[segmentIndex]
    }
    
//    @objc private func chouseButtonAction(sender: UIButton) {
//
////        let bookingVC = BookingViewController()
//
//        let navController = UINavigationController(rootViewController: bookingVC)
//
//        let segmentIndex = segmentedControl.selectedSegmentIndex
//
//        bookingVC.houseImage.image = imageArray[segmentIndex]
//        bookingVC.nameHouseLabel.text = nameHouseArray[segmentIndex]
//
//        navController.modalPresentationStyle = .fullScreen
//        show(bookingVC, sender: true)
//    }
}
