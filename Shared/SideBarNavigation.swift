//
//  SideBarNavigation.swift
//  Ptolemy
//
//  Created by Sam Smallman on 28/09/2020.
//

import SwiftUI

struct SidebarNavigation: View {
        
    @Binding var currentSelection: Selection
    
    var optionalCurrentSelection: Binding<Selection?> {
        Binding<Selection?>(
            get: {
                return currentSelection == .none ? nil : currentSelection
            },
            set: { newValue in
                currentSelection = newValue ?? .none
            }
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: GlobalView(), tag: Selection.global, selection: optionalCurrentSelection) {
                    Label("Global", systemImage: "globe")
                }
                NavigationLink(destination: RoomView(), tag: Selection.room, selection: optionalCurrentSelection) {
                    Label("Room", systemImage: "person.3")
                }
            }
            .listStyle(SidebarListStyle())
            
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Section(header: Text("Units")) {
                        }
                    }
                    label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
                #endif
            }
            
            Text("No Selection")
        }
    }
    
}
