//
//  ContentView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @ObservedObject var webSocketClient:WebSocketClient
    @State var messages = [Message]()
    
    @Binding var messageToSend:String
    @State var selectedPhoto:PhotosPickerItem? = nil
    
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
                    ReceivedMessageCellView(message: message, minSpacerLength: halfScreenWidth)
                    case "sent":
                        SentMessageCellView(text: message.content, minSpacerLength: halfScreenWidth)
                    default:
                        Text("error on switch statement")
                }
            }.onChange(of: webSocketClient.lastReceivedMessage) { newValue in
                print("fugskdfj")
                print(webSocketClient.lastReceivedMessage)
                messages.append(ChatProtocol.decodeMessage(string: newValue))
            }.onChange(of: webSocketClient.lastReceivedData) { newValue in
                if let d = UIImage(data: newValue){
                    UIImage(data: newValue)
                }
            }.onChange(of: webSocketClient.lastReceivedData) { newValue in
                UIImage(data: newValue)
            }
            TextField("SendMessage", text: $messageToSend)
            .onSubmit {
                let message = Message(id: messages.count, content: self.messageToSend, messageType: "sent", name: "Joyce", date: Message.getMessageDate())
                messages.append(message)
                webSocketClient.sendText(str: ChatProtocol.encodeMessage(message: message))
                Task{
                    if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                        webSocketClient.sendData(d: data)
                    }
                }
                
            }
            PhotosPicker("Selectionner une photo", selection: $selectedPhoto)
            /*Button("Send image"){
                print("button image")
                if let data = UIImage(named: "jojo")?.jpegData(compressionQuality: 1){
                    print("jenvoie l'image")
                    webSocketClient.sendData(d: data)
                }
            }*/
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
