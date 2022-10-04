//
//  NewViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 04.10.2022.
//

import UIKit
/// Контроллер со switch
final class StarViewController: UIViewController {
   
    // MARK: - Private Properties
    
    private let colorSwitch: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = .systemYellow
        sw.setOn(false, animated: true)
        return sw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Private methods
    
    private func createUI() {
        
        view.backgroundColor = .systemMint
        
        colorSwitch.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        colorSwitch.center = view.center
        view.addSubview(colorSwitch)
        
        colorSwitch.addTarget(self, action: #selector(colorSwitchAction(sender: )), for: .touchUpInside)
    }
    
    @objc private func colorSwitchAction(sender: UISwitch) {
        
        guard colorSwitch.isOn else {
            view.backgroundColor = .systemMint
            return
        }
        view.backgroundColor = .systemIndigo
    }
}
