//
//  ClockViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 02.10.2022.
//

import UIKit
/// Экран мировые часы
final class ClockViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        
        view.backgroundColor = .black

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Мировые часы"

        navigationController?.navigationBar.tintColor = .systemOrange
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: nil)
    }

}
