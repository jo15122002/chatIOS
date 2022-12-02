//
//  chatApp.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

@main
struct chatApp: App {
    
    @StateObject var webSocketClient = WebSocketClient(context: .defaultServer())
    @State var textToSend = "text to send"
    
    var body: some Scene {
        WindowGroup {
            ContentView(webSocketClient: webSocketClient, messageToSend: $textToSend)
        }
    }
}
