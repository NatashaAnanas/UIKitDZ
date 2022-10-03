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
            createNavController(viewController: PageOneViewController(),
                                imageName: "swift"),
            createNavController(viewController: PageTwoViewController(),
                                imageName: "bolt")
        ]
    }
    
    private func createNavController(viewController: UIViewController,
                                     imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.tabBarItem.image = UIImage(systemName: imageName)
        
        navController.tabBarItem.image?.withTintColor(.black)
        
        return navController
    }
}
