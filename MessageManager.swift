//
//  MessageManager.swift
//  chat
//
//  Created by digital on 12/12/2022.
//

import Foundation
import UIKit

class MessageManager{
    static let instance = MessageManager()
    
    func createTextMessage(string:String, id:Int, type:String, name:String, date:String) -> Message{
        return Message(id: id, content: string, messageType: type, name: name, date: date, messageContentType: Message.MessageContentType.Text)
    }
    
    func createImageMessage(image:UIImage, id:Int, type:String, name:String, date:String) -> Message{
        return Message(id: id, content: "\(type) an image", messageType: type, name: name, date: date, image: image, messageContentType: Message.MessageContentType.Image)
    }
    
    func createSoundMessage(sound:Data, id:Int, type:String, name:String, date:String) -> Message{
        return Message(id: id, content: "\(type) an audio", messageType: type, name: name, date: date, sound: sound, messageContentType: Message.MessageContentType.Sound)
    }
    
    func createMessage(string:String, id:Int, type:String, name:String, date:String) -> Message{
        return createTextMessage(string: string, id: id, type: type, name: name, date: date)
    }
    
    func createMessage(data:Data, id:Int, type:String, name:String, date:String) -> Message{
        if let d = UIImage(data: data){
            return createImageMessage(image: d, id: id, type: type, name: name, date: date)
        }else{
            return createSoundMessage(sound: data, id: id, type: type, name: name, date: date)
        }
    }
}
