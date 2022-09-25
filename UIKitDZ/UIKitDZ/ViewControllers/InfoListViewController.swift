//
//  InfoListViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 23.09.2022.
//

import UIKit
/// InfoListViewController - список дней рождений
class InfoListViewController: UIViewController {
    
    let firstImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Саша")
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.layer.borderColor = UIColor.systemIndigo.cgColor
        image.layer.borderWidth = 2
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let secondImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Ирина")
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.layer.borderColor = UIColor.systemIndigo.cgColor
        image.layer.borderWidth = 2
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let thirdImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Настя")
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        image.layer.cornerRadius = 35
        image.layer.borderColor = UIColor.systemIndigo.cgColor
        image.layer.borderWidth = 2
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var addImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sasha"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .left
        return label
    }()
    
    let secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ирина Федосеева"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .left
        return label
    }()
    
    let thirdNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Настя"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .left
        return label
    }()
    
    var addNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .left
        return label
    }()
    
    var firstDayLabel: UILabel = {
        let label = UILabel()
        label.text = "18 дней"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    let secondDayLabel: UILabel = {
        let label = UILabel()
        label.text = "28 дней"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    let thirdDayLabel: UILabel = {
        let label = UILabel()
        label.text = "55 дней"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    var addDayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    let firstInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "2 марта, исполнится 25 лет"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    let secondInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "4 сентября, исполнится 27 лет"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    let thirdInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "17 апреля, исполнится 20 лет"
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    var addInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    let infoUsers = InfoUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSettings()
        createUI()
        createNewCell()
    }

    func createUI() {
        
        // MARK: - Create UIImageView
        
        firstImage.frame = CGRect(x: 20, y: 130, width: 70, height: 70)
        view.addSubview(firstImage)
        
        secondImage.frame = CGRect(x: 20, y: 230, width: 70, height: 70)
        view.addSubview(secondImage)
        
        thirdImage.frame = CGRect(x: 20, y: 330, width: 70, height: 70)
        view.addSubview(thirdImage)
        
        // MARK: - Create UILabel
        
        firstNameLabel.frame = CGRect(x: 100, y: 135, width: 200, height: 20)
        view.addSubview(firstNameLabel)
        
        secondNameLabel.frame = CGRect(x: 100, y: 235, width: 200, height: 20)
        view.addSubview(secondNameLabel)
        
        thirdNameLabel.frame = CGRect(x: 100, y: 335, width: 200, height: 20)
        view.addSubview(thirdNameLabel)
        
        firstInfoLabel.frame = CGRect(x: 100, y: 160, width: 300, height: 20)
        view.addSubview(firstInfoLabel)
        
        secondInfoLabel.frame = CGRect(x: 100, y: 260, width: 300, height: 20)
        view.addSubview(secondInfoLabel)
        
        thirdInfoLabel.frame = CGRect(x: 100, y: 360, width: 300, height: 20)
        view.addSubview(thirdInfoLabel)
        
        firstDayLabel.frame = CGRect(x: 320, y: 135, width: 100, height: 20)
        view.addSubview(firstDayLabel)
        
        secondDayLabel.frame = CGRect(x: 320, y: 235, width: 100, height: 20)
        view.addSubview(secondDayLabel)
        
        thirdDayLabel.frame = CGRect(x: 320, y: 335, width: 100, height: 20)
        view.addSubview(thirdDayLabel)
    }
    
    func createNewCell() {
            
            addImage.frame = CGRect(x: 20, y: 430, width: 70, height: 70)
            view.addSubview(addImage)
        
            addNameLabel.frame = CGRect(x: 100, y: 435, width: 200, height: 20)
            view.addSubview(addNameLabel)

            addInfoLabel.frame = CGRect(x: 100, y: 460, width: 300, height: 20)
            view.addSubview(addInfoLabel)
            
            addDayLabel.frame = CGRect(x: 320, y: 435, width: 100, height: 20)
            view.addSubview(addDayLabel)
    }
    
    func viewSettings() {
        self.title = "Birthday"
        view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(actionAdd(sender: )))
    }
    
    @objc func actionAdd(sender: UIBarButtonItem) {
        
        let threeVC = AddPersonViewController()
        self.navigationController?.pushViewController(threeVC, animated: false)
        
    }
}
