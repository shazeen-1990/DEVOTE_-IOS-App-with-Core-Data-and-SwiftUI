//
//  SoundPlayer.swift
//  Devote
//
//  Created by Shazeen Thowfeek on 27/03/2024.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
            
        }catch{
            print("Could not find the play sound file.")
        }
    }
        
}
