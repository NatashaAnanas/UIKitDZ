//
//  BaseTabBarController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 30.09.2022.
//

import UIKit
/// - Бзовый контроллер
class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: PageOneViewController(), titel: "Будильник", imageName: "house"),
            createNavController(viewController: PageTwoViewController(), titel: "Секундомер", imageName: "bed.double")
        ]
    }
    
    private func createNavController(viewController: UIViewController,
                                     titel: String,
                                     imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        
        navController.tabBarItem.image = UIImage(systemName: imageName)
        
        return navController
    }
}
