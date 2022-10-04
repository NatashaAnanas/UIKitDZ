//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//
//
import UIKit
/// Kонтроллер выбора домов
final class HouseViewController: UIViewController {

    private enum Constants {
        static let descriptionHouseArray = [  """
    Cовременная комфортабельная загородная резиденция, располагающая всем необходимым для работы и отдыха.
    Два этажа сообщаются между собой лестничными пролетами и лифтом, кровля эксплуатируемая.
    Планировка первого этажа условно разделена на две половины.
    Одно крыло занимает бассейн с хаммамом, душевыми, сауной, тренажерным залом.
""",
    """
    Проект двухэтажного дома в стиле hi-tech создавался для большой гостеприимной семьи.
    Площадь дома разбита на четыре спальни, дополненные гардеробными и санузлами,
несколько кабинетов, бассейн, сауну, хамам, парикмахерскую, комнаты персонала, тренажерный зал,
а также две просторные террасы.
    На территории плоской крыши в летний период можно организовать солярий на открытом воздухе.
""",
                                           
    """
    Облик этого загородного дома в стиле кубизм предельно прост, лаконичен и нейтрален.
    Главной архитектурной особенностью является панорамное остекление – прием,
    который задает настроение и фасаду, и интерьеру:
    визуально жилое пространство становится не только светлее, но и больше, масштабнее.
    Особое место в доме занимает зона отдыха – бассейн с панорамным остеклением и сауна.

Просторная гостиная одинаково хорошо подходит и для уютных семейных вечеров,
 и для шумных праздников и встреч с друзьями.
"""
        ]
    }
    
    // MARK: - Private Properties
    
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
        text.backgroundColor = .systemBackground
        text.textColor = .black
        text.contentMode = .center
        text.isEditable = false
        text.isSelectable = false
        text.font = .systemFont(ofSize: 20)
        return text
    }()
    
    private let nameHouseArray = ["Forest Residence", "Aura Haus", "Ultra Park"]
    
    private var segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        settingsView()
    }
    
    // MARK: - Private methods
    
    private func settingsView() {
        
        view.backgroundColor = .systemBackground
        tabBarController?.title = "Life Deluxe"
    }
    
    private func createUI() {
        
        chouseButton.frame = CGRect(x: 0, y: 685, width: 170, height: 50)
        chouseButton.center.x = view.center.x
        
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
        descriptionTextView.text = Constants.descriptionHouseArray[segmentIndex]
    }
}
