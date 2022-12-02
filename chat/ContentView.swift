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
        var halfScreenWidth = CGFloat(UIScreen.main.bounds.width/2)
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
                    ReceivedMessageCellView(text: message.content, minSpacerLength: halfScreenWidth)
                    case "sent":
                        SentMessageCellView(text: message.content, minSpacerLength: halfScreenWidth)
                    default:
                        Text("error on switch statement")
                }
            }.onChange(of: webSocketClient.lastReceivedMessage) { newValue in
                print("fugskdfj")
                print(webSocketClient.lastReceivedMessage)
                messages.append(ChatProtocol.decodeMessage(string: newValue))
            }
            TextField("SendMessage", text: $messageToSend)
            .onSubmit {
                let message = Message(id: messages.count, content: self.messageToSend, messageType: "sent", name: "Joyce", date: Message.getMessageDate())
                messages.append(message)
                webSocketClient.sendText(str: ChatProtocol.encodeMessage(message: message))
            }
            /*Button("Simul rec") {
                messages.append(Message(id: messages.count, content: "new received message", messageType: "received"))
            }*/
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
