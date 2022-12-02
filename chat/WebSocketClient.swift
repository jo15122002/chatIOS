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
    @Published var lastReceivedData:Data = Data()
    
    @Published var connected:Bool = false
    
    var name = "Joyce"
    
    struct Ctx{
        var host:String
        var port:String
        var route:String
        
        func urlString()->String{
            return "ws://\(host):\(port)/\(route)"
        }
        
        func url()->URL?
        {
            return URL(string: self.urlString())
        }
        
        static func defaultServer()->Ctx{
            Ctx(host: "172.28.55.235", port: "8080", route: "toto")
        }
    }
    
    var socket:NWWebSocket?
    
    init(context:Ctx){
        if let socketUrl = context.url(){
            socket = NWWebSocket(url: socketUrl, connectAutomatically: true)
            socket?.delegate = self
        }
    }
    
    func sendText(str:String){
        socket?.send(string: str)
    }
    
    func sendData(d:Data){
        socket?.send(data: d)
    }
}

extension WebSocketClient:WebSocketConnectionDelegate{
    func webSocketDidConnect(connection: WebSocketConnection) {
        print("Connected")
        self.connected = true
        //socket?.send(string: name)
        //socket?.send(data: <#T##Data#>)
    }
    
    func webSocketDidDisconnect(connection: WebSocketConnection, closeCode: NWProtocolWebSocket.CloseCode, reason: Data?) {
        print("Disconnected")
        self.connected = false
    }
    
    func webSocketViabilityDidChange(connection: WebSocketConnection, isViable: Bool) {
        print("Socket viability")
    }
    
    func webSocketDidAttemptBetterPathMigration(result: Result<WebSocketConnection, NWError>) {
        print("Attempt better path")
    }
    
    func webSocketDidReceiveError(connection: WebSocketConnection, error: NWError) {
        print("error reçue")
    }
    
    func webSocketDidReceivePong(connection: WebSocketConnection) {
        print("pong reçu")
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, string: String) {
        print("nouveau message")
        self.lastReceivedMessage = string
    }
    
    func webSocketDidReceiveMessage(connection: WebSocketConnection, data: Data) {
        print("nouveau message data")
        self.lastReceivedData = data
    }
    
    
    
}
