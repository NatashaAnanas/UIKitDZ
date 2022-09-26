//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// StartViewController - экран приветствия
class StartViewController: UIViewController {

    private let startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 45
        button.layer.borderWidth = 5
        button.setTitle("START", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.frame = CGRect(x: 0, y: 600, width: 280, height: 90)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsView()
    }
    
    private func settingsView() {
        
        startButton.center.x = view.center.x
        view.addSubview(startButton)
        view.backgroundColor = .tertiaryLabel
        
        startButton.addTarget(self, action: #selector(startButtonAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func startButtonAction(sender: UIButton) {
            
        let tabBarVC = BaseTabBarController()
        
        let navController = UINavigationController(rootViewController: tabBarVC)
        
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}
