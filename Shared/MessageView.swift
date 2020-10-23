//
//  MessageView.swift
//  Messenger App
//
//  Created by Daniel Higgott on 21/10/2020.
//

import SwiftUI

struct MessageView: View {
    
    var message: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15, content: {
            
            if message.user.isCurrentUser {
                Spacer()
            }
            
            //isCurrentUser ? Color.white : Color.black
            VStack(alignment: message.user.isCurrentUser ? HorizontalAlignment.trailing : HorizontalAlignment.leading, spacing: .some(0.0), content: {
                Text(message.user.name)
                ContentMessageView(message: message)
            })
            
            if !message.user.isCurrentUser {
                Spacer()
            }
            
            
            
            
        }).padding(5)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: Message(user: User(name: "Danny", isCurrentUser: false), content: "Here is some content, it is super long. whatHere is some content, "))
    }
}
