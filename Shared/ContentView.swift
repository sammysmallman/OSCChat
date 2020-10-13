//
//  ContentView.swift
//  Shared
//
//  Created by Sam Smallman on 28/09/2020.
//

import SwiftUI

enum Selection: String {
    case global
    case room
    case none
    
    #if os(iOS)
    case settings
    #endif
}

struct ContentView: View {
    
    var service = OSCChatService()
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    @SceneStorage("currentSelection") private var currentSelection: Selection = .global
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TabNavigation(currentSelection: $currentSelection).environmentObject(service)
        } else {
            SidebarNavigation(currentSelection: $currentSelection).environmentObject(service)
        }
        #else
        SidebarNavigation(currentSelection: $currentSelection)
            .frame(minWidth: 500, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
