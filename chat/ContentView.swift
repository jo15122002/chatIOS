//
//  ContentView.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var webSocketClient:WebSocketClient
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("connected State")
                Spacer()
            }
            Spacer()
            VStack{
                Text("Message")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var webSocketClient = WebSocketClient(context: .defaultServer())
    
    static var previews: some View {
        ContentView(webSocketClient: webSocketClient)
    }
}
