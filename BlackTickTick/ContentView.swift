//
//  ContentView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 13/10/23.
//

import SwiftUI

struct ContentView: View {
    var colors:[Color]=[.red,.pink,.blue,.yellow,.brown,.pink,.green]
    @State var idnex=0
    var body: some View {
        TabView{
            TaskView().tabItem { Label("Look", systemImage: "doc.text.fill") }
            MatrixView().tabItem { Label("Matrix", systemImage: "circle.grid.2x2") }
            SwiftUIView().tabItem { Label("Pomodoro", systemImage: "clock.fill") }
            TestUIView().tabItem { Label("Habit", systemImage: "stairs") }
            SettingsView().tabItem{Label("Settings", systemImage: "gear")}
            
        }
        
        
        
    }
}

#Preview {
    ContentView()
        .environmentObject(Manager())
}
