//
//  GlobalView.swift
//  OSCChat
//
//  Created by Sam Smallman on 13/10/2020.
//

import SwiftUI

struct GlobalView: View {
    
    @EnvironmentObject var service: OSCChatService
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                do {
                    try service.start()
                } catch {
                    print(error)
                }
            }) {
                Text("Join Multicast Group")
            }
            TextField("Enter your message here...", text: $message)
            Button(action: {
                service.send(message: message)
            }) {
                Text("Send")
            }
        }
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView()
    }
}
