//
//  FirstTrackViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 24.09.2022.
//
import AVFoundation
import UIKit
/// FirstTrackViewController - Первый трек
final class FirstTrackViewController: UIViewController {

    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var volumSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    var nameTrackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: 154, y: 456, width: 120, height: 34)
        return label
    }()
    
    var player = AVAudioPlayer()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImage()
        playMusic()
    }
    
    // Слайдер звук
    @IBAction func volumSliderAction(_ sender: UISlider) {
        
        player.volume = Float(TimeInterval(sender.value))
    }
    
    // Слайдер трека
    @IBAction func timeSliderAction(_ sender: UISlider) {
        
        player.currentTime = TimeInterval(timeSlider.value)
        timeSlider.maximumValue = Float(player.duration)
        self.player.play()
    }
    
    // Кнопка плей
    @IBAction func playButtonAction(_ sender: UIButton) {
        
        let pauseImage = UIImage(systemName: "pause.circle")

        let playImage = UIImage(systemName: "play.circle")

        if player.isPlaying == false {
        self.player.play()
            sender.setImage(pauseImage, for: .normal)
        } else {
            self.player.pause()
            sender.setImage(playImage, for: .normal)
        }
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        
        player.currentTime += 10
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        player.currentTime -= 10
    }
    
    @objc private func updateTime() {
        
        self.timeSlider.value = Float(player.currentTime)
        let currentTime = player.currentTime
        let minutes = Int(currentTime / 60)
        let seconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
        startTimeLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String

        let difTime = player.currentTime - player.duration
        let difminutes = Int(difTime / 60)
        let difseconds = Int(-difTime.truncatingRemainder(dividingBy: 60))
        endTimeLabel.text = NSString(format: "%02d:%02d", difminutes, difseconds) as String
    }
        
    private func playMusic() {
        do {
            if let audio = Bundle.main.path(forResource: "Show", ofType: "mp3") {

                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
                self.timeSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    }
    
    private func createImage() {

        self.title = "Playing from album"
        
        albumImage.layer.cornerRadius = 30
        volumSlider.minimumValue = 0
        volumSlider.maximumValue = 14
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
        view.addSubview(nameTrackLabel)
    }
}
