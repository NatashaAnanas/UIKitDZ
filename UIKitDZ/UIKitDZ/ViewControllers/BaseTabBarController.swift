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

        view.backgroundColor = .green
        viewControllers = [ ViewController(), ViewController()]
    }
}
