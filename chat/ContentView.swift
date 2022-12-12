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
    //@State var selectedPhoto:PhotosPickerItem? = nil
    
    @ObservedObject var audioRecorder: AudioRecorder
    @State private var isPressing:Bool = false
    
    var body: some View {
        var halfScreenWidth = CGFloat(UIScreen.main.bounds.width/3)
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
                        SentMessageCellView(message: message, minSpacerLength: halfScreenWidth)
                    default:
                        Text("error on switch statement")
                }
            }.onChange(of: webSocketClient.lastReceivedMessage) { newValue in
                messages.append(ChatProtocol.decodeMessage(string: newValue, id: messages.count))
            }.onChange(of: webSocketClient.lastReceivedData) { newValue in
                messages.append(MessageManager.instance.createMessage(data: newValue, id: messages.count, type: "received", name: "inconnu", date: "date inconnue"))
            }
            TextField("SendMessage", text: $messageToSend)
            .onSubmit {
                let message = MessageManager.instance.createMessage(string: self.messageToSend, id: messages.count, type: "sent", name: "Joyce", date: Message.getMessageDate())
                messages.append(message)
                webSocketClient.sendText(str: ChatProtocol.encodeMessage(message: message))
                Task{
                    /*if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                        webSocketClient.sendData(d: data)
                        messages.append(MessageManager.instance.createMessage(data: data, id: messages.count, type: "sent", name: "Joyce", date: Message.getMessageDate()))
                        self.selectedPhoto = nil
                    }*/
                }
            }
            HStack{
                Spacer()
                //PhotosPicker("Selectionner une photo", selection: $selectedPhoto)
                Spacer()
                Button("SendAudio") {
                    //rien pour l'instant
                }.onLongPressGesture(minimumDuration: 2, maximumDistance: .infinity, pressing:{ isPressing in
                    self.isPressing = isPressing
                    self.audioRecorder.startStop()
                    
                    if(!self.isPressing){
                        print("button released")
                        if let audioData = try? Data(contentsOf: self.audioRecorder.getDocumentsDirectory().appendingPathComponent("recording.m4a")){
                            //AudioPlayer.getInstance().playSound(data: audioData)
                            
                            webSocketClient.sendData(d: audioData)
                            messages.append(MessageManager.instance.createMessage(data: audioData, id: messages.count, type: "sent", name: "Joyce", date: Message.getMessageDate()))
                        }
                    }
                }, perform: {})
                Spacer()
            }
            
            
            
            
            
            
            //Boutons de simulation//
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
    @State static var textToSend = ""
    static var audioRecorder = AudioRecorder()
    
    static var previews: some View {
        ContentView(webSocketClient: webSocketClient, messages: messages, messageToSend: $textToSend, audioRecorder: audioRecorder)
    }
}
