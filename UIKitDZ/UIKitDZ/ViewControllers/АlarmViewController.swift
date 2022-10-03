//
//  AlarmViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 02.10.2022.
//

import UIKit
/// Экран будильник
final class AlarmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .black

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Будильник"

        navigationController?.navigationBar.tintColor = .systemOrange
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addAlarmAction))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Править",
                                                           style: .plain,
                                                           target: self,
                                                           action: nil)
    }
    
    @objc private func addAlarmAction() {

        let setAlarmVC = SetAlarmViewController()
        
        let navController = UINavigationController(rootViewController: setAlarmVC)
        
        navController.modalPresentationStyle = .formSheet
        present(navController, animated: true)
    }
}
