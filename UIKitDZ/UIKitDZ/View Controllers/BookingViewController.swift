//
//  ViewControllerTwo.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 22.09.2022.
//

import UIKit
/// BookingViewController
class BookingViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var guestsNumber: UITextField!
    
    @IBOutlet weak var numberOfTable: UITextField!
    
    @IBOutlet weak var billButton: UIButton!
    
    @IBOutlet weak var switchThree: UISwitch!
    
    @IBOutlet weak var switchTwo: UISwitch!
    
    @IBOutlet weak var switchOne: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSwitch()
        createButton()
    }
    
    func createSwitch() {
        switchOne.isOn = true
        switchTwo.isOn = false
        switchThree.isOn = false
    }
    
    func createButton() {
        billButton.layer.cornerRadius = 22
    }
    
    @IBAction func billButtonAction(_ sender: Any) {
        let alertControlle = UIAlertController(title: .none, message: "Выставить счет", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Чек", style: .default) { _ in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let newVC = storyboard.instantiateViewController(
                withIdentifier: "vc3"
            ) as? BillViewController else { return }
            self.present(newVC, animated: true)
        }
        
        let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        alertControlle.addAction(alertAction)
        alertControlle.addAction(alertActionCancel)
        present(alertControlle, animated: true)
    }
}
