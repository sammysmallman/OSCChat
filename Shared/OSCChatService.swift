//
//  OSCChatService.swift
//  OSCChat (iOS)
//
//  Created by Sam Smallman on 13/10/2020.
//

import Foundation
import OSCKit
import NetUtils

class OSCChatService: ObservableObject {
    
    private let uuid = UUID()
    private let server: OSCServer = OSCServer()
    private let address: String = "239.254.0.1"
    private let port: UInt16 = 3090
   
    public func start() throws {
        server.delegate = self
        server.port = port
        server.interface = Interface.allInterfaces().first!.name
        try server.startListening(with: [address])
    }
    
    public func send(message: String) {
        let client = OSCClient()
        client.host = address
        client.port = port
        let messageUUID = UUID()
        let oscMessage = OSCMessage(with: "/messenger/me/say", arguments: [messageUUID.uuidString, uuid.uuidString, message])
        client.send(packet: oscMessage)
    }
}

extension OSCChatService: OSCPacketDestination {
    
    func take(message: OSCMessage) {
        print(OSCAnnotation.annotation(for: message, with: .spaces, andType: true))
    }
    
    func take(bundle: OSCBundle) {
        print("Received Bundle")
        print(bundle.elements.count)
    }
    
    
}
