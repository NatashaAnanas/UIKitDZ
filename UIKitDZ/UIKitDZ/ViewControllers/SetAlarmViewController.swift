//
//  SetAlarmViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 03.10.2022.
//

import UIKit
/// Установка нового будильника
final class SetAlarmViewController: UIViewController {
    
    let timePickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    let minute = Array(0...59)
    let hour = Array(0...23)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        
        navigationItem.title = "Добавление"
        view.backgroundColor = .darkText
        
        navigationController?.navigationBar.tintColor = .systemOrange
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить",
                                                            style: .plain,
                                                            target: self,
                                                            action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Править",
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
        
        timePickerView.frame = CGRect(x: 0, y: 10, width: 300, height: 250)
        timePickerView.center.x = view.center.x
        
        timePickerView.delegate = self
        timePickerView.dataSource = self
        
        view.addSubview(timePickerView)
    }
}
