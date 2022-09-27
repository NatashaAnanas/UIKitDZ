//
//  SecondTrackViewController.swift
//  UIKitDZ
//
//  Created by Анастасия Козлова on 24.09.2022.
//
import AVFoundation
import UIKit
/// SecondTrackViewController - второй трек
final class SecondTrackViewController: UIViewController {

    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var volumSlider: UISlider!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var nameTrackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: 154, y: 448, width: 120, height: 34)
        return label
    }()
    
    var player = AVAudioPlayer()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImage()
        playMusic()
        
    }
    
    // Слайдер времени
    @IBAction func timeSliderAction(_ sender: UISlider) {
        
        player.currentTime = TimeInterval(sender.value)
        sender.maximumValue = Float(player.duration)
        self.player.play()
    }
    
    // Слайдер звука
    @IBAction func volumSliderAction(_ sender: UISlider) {
        
        player.volume = Float(TimeInterval(sender.value))
    }
    
    // Кнопка плей
    @IBAction func playButtonAction(_ sender: UIButton) {
        
        let pauseImage = UIImage(systemName: "pause.circle")
        let playImage = UIImage(systemName: "play.circle")
        
        guard player.isPlaying == false else {
            
            self.player.pause()
            sender.setImage(playImage, for: .normal)
            return
        }
        self.player.play()
        sender.setImage(pauseImage, for: .normal)
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        
        player.currentTime += 15
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        
        player.currentTime -= 15
    }
    
    private func createImage() {
        
        navigationController?.navigationBar.topItem?.titleView?.tintColor = .black
        title = "Playing from album"
        
        albumImage.layer.cornerRadius = 30

        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
        
        view.addSubview(nameTrackLabel)
    }
        
    private func playMusic() {
        do {
            
            if let audio = Bundle.main.path(forResource: "Селяви", ofType: "mp3") {
                
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
                self.timeSlider.maximumValue = Float(player.duration)
                print("Start")
            }
        } catch {
            print("Error")
        }
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
}
