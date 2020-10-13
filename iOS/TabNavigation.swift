//
//  TabNavigation.swift
//  Ptolemy (iOS)
//
//  Created by Sam Smallman on 28/09/2020.
//

import SwiftUI

struct TabNavigation: View {
        
    @Binding var currentSelection: Selection
    
    var body: some View {
        TabView(selection: $currentSelection) {
            GlobalView()
                .tabItem {
                    Label("Global", systemImage: "globe")
                }
                .tag(Selection.global)
            RoomView()
                .tabItem {
                    Label("Room", systemImage: "person.3")
                }
                .tag(Selection.room)
        }
    }
}

