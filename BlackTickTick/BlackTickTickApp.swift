//
//  BlackTickTickApp.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 13/10/23.
//

import SwiftUI

@main
struct BlackTickTickApp: App {
    @StateObject  var manager=Manager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
