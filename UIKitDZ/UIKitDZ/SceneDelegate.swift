//
//  SceneDelegate.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//

import UIKit
/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    var navController = UINavigationController()

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            self.window = UIWindow(windowScene: windowScene)
            
            let viewController = SignInViewController()
            self.navController = UINavigationController(rootViewController: viewController)
            self.window?.rootViewController = navController
            self.window?.backgroundColor = .white
            self.window?.makeKeyAndVisible()
    }
}
