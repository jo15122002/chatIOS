//
//  ChatProtocol.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import Foundation

class ChatProtocol{
    
    static func encodeMessage(message:Message)->String{
        return "name::Joyce##content::\(message.content)##date::\(Message.getMessageDate())"
    }
    
    static func decodeMessage(string:String)->Message{
        let components = string.components(separatedBy: "##")
        var content = ""
        var name = ""
        var date = ""
        for i in 0..<components.count{
            var keyValue = components[i].components(separatedBy: "::")
            switch keyValue[0]{
            case "name":
                name = keyValue[1]
            case "content":
                content = keyValue[1]
            case "date":
                date=keyValue[1]
            default:
                break
            }
        }
        
        var message = Message(id: 99, content: content, messageType: "received", name: name, date: date)
        return message
    }
}
