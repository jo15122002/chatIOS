//
//  Message.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import Foundation

struct Message: Identifiable{
    var id:Int
    var content:String
    var messageType:String
    var name:String
    var date:String
    
    
    static func defaultSentMessage()->Message{
        return Message(id: 0, content: "Un message envoyé", messageType: "sent", name: "Joyce", date: getMessageDate())
    }
    
    static func defaultReceivedMessage()->Message{
        return Message(id: 1, content: "Un message reçu", messageType: "received", name: "Joyce", date: getMessageDate())
    }
    
    static func defaultMessages()->Messages{
        return [
            defaultSentMessage(),
            defaultReceivedMessage(),
            defaultSentMessage(),
            defaultSentMessage(),
            defaultSentMessage(),
            defaultReceivedMessage(),
            defaultReceivedMessage(),
            defaultReceivedMessage(),
        ]
    }
    
    static func getMessageDate()->String{
        let hour = Calendar.current.component(.hour, from: Date())
        let minutes = Calendar.current.component(.minute, from: Date())
        return "\(hour):\(minutes)"
    }
}

typealias Messages = [Message]
