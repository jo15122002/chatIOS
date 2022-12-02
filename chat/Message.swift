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
    
    static func defaultSentMessage()->Message{
        return Message(id: 0, content: "Un message envoyé", messageType: "sent")
    }
    
    static func defaultReceivedMessage()->Message{
        return Message(id: 1, content: "Un message reçu", messageType: "received")
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
}

typealias Messages = [Message]
