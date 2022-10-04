//
//  BaseTabBarController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 04.10.2022.
//

import UIKit
/// Базовый TabBarController
class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createViewController(viewController: ViewController(), icon: "book", titel: "BOOK"),
            createViewController(viewController: NewViewController(), icon: "star", titel: "STAR")
        ]
    }
    
    private func createViewController(viewController: UIViewController,
                                      icon: String,
                                      titel: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = titel
        
        navController.tabBarItem.image = UIImage(systemName: icon)
    
        return navController
    }
}
