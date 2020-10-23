//
//  ContentMessageView.swift
//  Messenger App
//
//  Created by Daniel Higgott on 21/10/2020.
//

import SwiftUI

struct ContentMessageView: View {
    
    var message: Message
    
    var body: some View {
        Text(message.content)
            .padding(10)
            .foregroundColor(message.user.isCurrentUser ? Color.white : Color(UIColor.label))
            .background(message.user.isCurrentUser ? Color(UIColor.systemBlue) : Color(UIColor.systemGray4))
            .cornerRadius(10)
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(message: Message(user: User(name: "Danny", isCurrentUser: false), content: "Hello World"))
    }
}
