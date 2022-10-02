//
//  AlarmViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 02.10.2022.
//

import UIKit
/// Будильник
class AlarmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .black

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Будильник"

        navigationController?.navigationBar.tintColor = .systemOrange
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: nil)
    }
}
