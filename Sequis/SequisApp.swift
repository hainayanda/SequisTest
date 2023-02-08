//
//  SequisApp.swift
//  Sequis
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import MainFeature

@main
struct SequisApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MainFeatureModule.shared)
        }
    }
}
