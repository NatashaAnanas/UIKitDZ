//
//  FlatViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 26.09.2022.
//

import UIKit
/// BedViewController - контроллер выбор кроватей
class BedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsView()
    }
    func settingsView() {
        self.view.backgroundColor = .groupTableViewBackground
    }
}
