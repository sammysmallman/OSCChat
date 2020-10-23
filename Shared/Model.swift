//
//  Model.swift
//  Messenger App
//
//  Created by Daniel Higgott on 21/10/2020.
//

import Foundation
/*
struct Message {
    var content: String
    var user: User
}
*/
struct User {
    var name: String
    var isCurrentUser: Bool
}

struct Message: Identifiable {
    
    let id = UUID()
    let user: User
    let content: String
    
}
