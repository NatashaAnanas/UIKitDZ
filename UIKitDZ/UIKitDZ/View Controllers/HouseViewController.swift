//
//  HouseViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 26.09.2022.
//

import UIKit
/// HouseViewController - выбор домов
class HouseViewController: UIViewController {
    
    let chouseButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "Hello"
        button.backgroundColor = .orange
        return button
    }()
    
    let imageViewRoom: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let imageArray = [UIImage(named: "дом1"),
                      UIImage(named: "дом2"),
                      UIImage(named: "дом3")]
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 27)
        label.textColor = .black
        label.contentMode = .center
        label.text = "Выберите объект"
        
        return label
    }()
    
    let nameHouseArray = ["Forest Residence", "Aura Haus", "Ultra Park"]
    
    let descriptText = Description()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "HOUSE"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.contentMode = .center
        return label
    }()
    
    let descriptionTextView: UITextView = {
        let text = UITextView()
        text.backgroundColor = .groupTableViewBackground
        text.textColor = .black
        text.contentMode = .center
        text.isEditable = false
        text.isSelectable = false
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    
    var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        settingsView()
    }
    
    func settingsView() {
        
        self.view.backgroundColor = .groupTableViewBackground
    }
    
    func createUI() {
        
        tabBarController?.title = "Life Deluxe"
        
        nameLabel.frame = CGRect(x: 0, y: 100, width: 110, height: 50)
        nameLabel.center.x = view.center.x
        view.addSubview(nameLabel)
        
        segmentedControl = UISegmentedControl(items: nameHouseArray)
        segmentedControl.frame = CGRect(x: 0, y: 700, width: 350, height: 50)
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
    
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentedControl {
            
            textLabel.text = ""
            let segmentIndex = segmentedControl.selectedSegmentIndex
            imageViewRoom.image = imageArray[segmentIndex]
            descriptionTextView.text = descriptText.descriptionArray[segmentIndex]
            
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }
}
