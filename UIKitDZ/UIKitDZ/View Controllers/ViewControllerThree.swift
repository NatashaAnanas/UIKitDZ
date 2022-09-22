//
//  ViewControllerThree.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 22.09.2022.
//

import UIKit
/// ViewControllerThree
class ViewControllerThree: UIViewController {

    @IBOutlet weak var billButton: UIButton!
    
    @IBOutlet weak var thankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billButton.layer.cornerRadius = 20
    }
    
    @IBAction func billButtonAction(_ sender: Any) {
        thankLabel.text = "Приходите к нам еще :)"
    }
}
