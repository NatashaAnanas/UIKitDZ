//
//  BaseTabBarController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 26.09.2022.
//

import UIKit
/// BaseTabBarController - TabBarController
class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            
            createNavController(viewController: HouseViewController(), titel: "House", imageName: "house"),
            createNavController(viewController: BedViewController(), titel: "Bed", imageName: "bed.double"),
        ]
    }
    
    fileprivate func createNavController (viewController: UIViewController,
                                          titel: String,
                                          imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
//        viewController.navigationItem.title = titel
        
        navController.tabBarItem.badgeColor = .systemMint
        navController.tabBarItem.badgeValue = "New"
        
        navController.tabBarItem.image = UIImage(systemName: imageName)
        
        return navController
    
    }
}
