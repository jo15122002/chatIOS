//
//  AudioPlayer.swift
//  chat
//
//  Created by digital on 12/12/2022.
//

import Foundation
import AVFoundation

class AudioPlayer{
    static let instance = AudioPlayer()
    private var audioPlayer:AVAudioPlayer?
    
    private init(){}
    
    static func getInstance() -> AudioPlayer{
        return self.instance
    }
    
    func playSound(data:Data){
        do{
            audioPlayer = try AVAudioPlayer(data: data)
            let isReady = audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            //print("je joue le son")
        }catch{
            print("impossible de jouer le son")
        }
    }
}
