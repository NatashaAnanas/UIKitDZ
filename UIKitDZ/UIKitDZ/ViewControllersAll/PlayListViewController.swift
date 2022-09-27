//
//  ViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 21.09.2022.
//
import UIKit
/// PlayListViewController - экран с треками
final class PlayListViewController: UIViewController {
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var nameFirstLabel: UILabel!
    @IBOutlet weak var nameSecondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImage()
    }
    
    @IBAction func trackFirstButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc2 = storyboard.instantiateViewController(withIdentifier: "vc2") as? FirstTrackViewController {
            vc2.nameTrackLabel.text = nameFirstLabel.text
            show(vc2, sender: nil)
        }
    }

    @IBAction func trackTwoButtonAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc3 = storyboard.instantiateViewController(withIdentifier: "vc3") as? SecondTrackViewController {
            vc3.nameTrackLabel.text = nameSecondLabel.text
            show(vc3, sender: nil)
        }
    }
    
    private func createImage() {
        
        title = "PList"
        
        firstImage.layer.cornerRadius = 10
        secondImage.layer.cornerRadius = 10
    }
}
