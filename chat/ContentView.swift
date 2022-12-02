//
//  ContentView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var webSocketClient:WebSocketClient
    @State var messages = [Message]()
    @Binding var messageToSend:String
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("connected State")
                Spacer()
            }
            Spacer()
            List(messages){ message in
                switch message.messageType{
                    case "received":
                        receivedMessageCellView(text: message.content)
                    case "sent":
                        sentMessageCellView(text: message.content)
                    default:
                        Text("error on switch statement")
                }
            }.onChange(of: webSocketClient.lastReceivedMessage) { newValue in
                messages.append(Message(id: messages.count, content: newValue, messageType: "received"))
            }
            TextField("SendMessage", text: $messageToSend).onSubmit {
                messages.append(Message(id: messages.count, content: self.messageToSend, messageType: "sent"))
            }
            Button("Simul rec") {
                messages.append(Message(id: messages.count, content: "new received message", messageType: "received"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var webSocketClient = WebSocketClient(context: .defaultServer())
    static var messages = Message.defaultMessages()
    @State static var textToSend = "Un texte a envoyer"
    
    static var previews: some View {
        ContentView(webSocketClient: webSocketClient, messages: messages, messageToSend: $textToSend)
    }
}
