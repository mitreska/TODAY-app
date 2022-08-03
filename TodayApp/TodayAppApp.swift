//
//  TodayAppApp.swift
//  TodayApp
//
//  Created by Mikha's Book on 02/08/22.
//

import SwiftUI
import FirebaseCore



@main
struct TodayAppApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
