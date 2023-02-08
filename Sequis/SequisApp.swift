//
//  SequisApp.swift
//  Sequis
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import MainFeature
import CommonNetworking

@main
struct SequisApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MainFeature.Module.shared)
                .environmentObject(CommonNetworking.Module.shared)
        }
    }
}
