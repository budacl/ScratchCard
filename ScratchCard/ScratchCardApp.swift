//
//  ScratchCardApp.swift
//  ScratchCard
//
//  Created by Lukas Budac on 21/04/2023.
//

import SwiftUI

@main
struct ScratchCardApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainScreenView()
        }
    }
}
