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
    @State var messages: [Message] = [Message(user: User(name: "Dan", isCurrentUser: true), content: "Hello everyone"), Message(user: User(name: "Kim", isCurrentUser: false), content: "Hello Dan"), Message(user: User(name: "Bob", isCurrentUser: false), content: "Hello World, this is a super long message that should cover a fair number of lines")]
    
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
            
            if #available(iOS 14.0, *) {
                ScrollView {
                    LazyVStack {
                        ForEach(messages, id: \.id) { message in
                            MessageView(message: message)
                        }
                    }
                    
                }
                
            } else {
                // For iOS 13
                List(messages) {message in
                    MessageView(message: message)
                }
            }
            
            TextField("Enter your message here...", text: $message).padding(.all, 5.0)
                
                
            /*
             Button(action: {
                 service.send(message: message)
             }) {
                 Text("Send")
             }
             */
            
        }
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView()
    }
}
