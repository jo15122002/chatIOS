//
//  WebSocketClient.swift
//  chat
//
//  Created by digital on 02/12/2022.
//

import Foundation
import Network

class WebSocketClient:ObservableObject{
    
    @Published var lastReceivedMessage:String = ""
    
    @Published var connected:Bool = false
    
    struct Ctx{
        var host:String
        var port:String
        var route:String
        
        func urlString()->String{
            return "ws://\(host):\(port)/\(route)"
        }
        
        func url()->URL?
        {
            return URL(string: urlString())
        }
        
        static func defaultServer()->Ctx{
            Ctx(host: "localhost", port: "8080", route: "jojo")
        }
    }
    
    var socket:NWWebSocket?
    
    init(context:Ctx){
        if let socketUrl = context.url(){
            socket = NWWebSocket(url: socketUrl, connectAutomatically: true)
            //socket?.delegate = self
        }
    }
    
    func sendText(str:String){
        socket?.send(string: str)
    }
}

extension WebSocketClient:WebSocketConnectionDelegate{
    func webSocketDidConnect(connection: WebSocketConnection) {
        self.connected = true
    }
    
    func webSocketDidDisconnect(connection: WebSocketConnection, closeCode: NWProtocolWebSocket.CloseCode, reason: Data?) {
        self.connected = false
    }
    
    func webSocketViabilityDidChange(connection: WebSocketConnection, isViable: Bool) {
        
    }
    
    func webSocketDidAttemptBetterPathMigration(result: Result<WebSocketConnection, NWError>) {
        
    }
    
    func webSocketDidReceiveError(connection: WebSocketConnection, error: NWError) {
        
    }
    
    func webSocketDidReceivePong(connection: WebSocketConnection) {
        
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, string: String) {
        self.lastReceivedMessage = string
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, data: Data) {
        
    }
    
    
    
}
