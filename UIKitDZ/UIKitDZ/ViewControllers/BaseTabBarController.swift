//
//  BaseTabBarController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 30.09.2022.
//

import UIKit
/// - Бзовый TabBar контроллер
final class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: PageOneViewController(), titel: "Будильник", imageName: "swift"),
            createNavController(viewController: PageTwoViewController(), titel: "Секундомер", imageName: "bolt")
        ]
    }
    
    private func createNavController(viewController: UIViewController,
                                     titel: String,
                                     imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        
        navController.tabBarItem.image = UIImage(systemName: imageName)

        navController.tabBarItem.image?.withTintColor(.black)
        
        return navController
    }
}
