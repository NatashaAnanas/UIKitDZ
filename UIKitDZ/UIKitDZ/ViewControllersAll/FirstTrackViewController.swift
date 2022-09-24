//
//  FirstTrackViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 24.09.2022.
//
import AVFoundation
import UIKit

/// FirstTrackViewController - Первый трек
class FirstTrackViewController: UIViewController {

    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var volumSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var player = AVAudioPlayer()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func volumSliderAction(_ sender: UISlider) {
        player.volume = Float(TimeInterval(sender.value))
    }
}
