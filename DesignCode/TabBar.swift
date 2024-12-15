//
//  TabBar.swift
//  DesignCode
//
//  Created by Nafish 

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem{
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem{
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    TabBar()
}
