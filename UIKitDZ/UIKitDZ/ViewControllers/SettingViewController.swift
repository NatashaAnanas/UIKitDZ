//
//  SettingViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 04.10.2022.
//

import UIKit
/// kj
class SettingViewController: UIViewController {
    
    let sizeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 14
        slider.maximumValue = 46
        slider.minimumTrackTintColor = .black
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    private func createUI() {
        
        view.backgroundColor = .white
        
        sizeSlider.frame = CGRect(x: 0, y: 150, width: 300, height: 40)
        sizeSlider.center = view.center
        view.addSubview(sizeSlider)
        
        sizeSlider.addTarget(self, action: #selector(sizeSliderAction(sender: )), for: .touchUpInside)
    }
    
    @objc func sizeSliderAction(sender: UISlider) {
    
        let vc = ViewController()
        
        vc.text.font = .systemFont(ofSize: CGFloat(sizeSlider.value))
        print(" vc \(sizeSlider.value)")
    }
}
