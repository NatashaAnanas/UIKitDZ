//
//  TimerViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 02.10.2022.
//

import UIKit
/// Таймер контроллер
class TimerViewController: UIViewController {

    @IBOutlet weak var cancellButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerPickerView: UIPickerView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var startUpButton: UIButton!
    @IBOutlet weak var cancelUpButton: UIButton!
    
    let hour = Array(0...23)
    let minute = Array(0...59)
    let second = Array(0...59)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    private func createUI() {
        
        startButton.setTitleColor( .white, for: .normal)
        startButton.layer.cornerRadius = 50
        
        startUpButton.layer.cornerRadius = 48
        startUpButton.layer.borderColor = UIColor.black.cgColor
        startUpButton.layer.borderWidth = 3
        
        cancellButton.setTitleColor( .white, for: .highlighted)
        cancellButton.layer.cornerRadius = 50
        
        cancelUpButton.layer.cornerRadius = 48
        cancelUpButton.layer.borderColor = UIColor.black.cgColor
        cancelUpButton.layer.borderWidth = 3
        
        timerPickerView.delegate = self
        timerPickerView.dataSource = self
        
        textLabel.layer.cornerRadius = 20
        textLabel.clipsToBounds = true
    }
}
