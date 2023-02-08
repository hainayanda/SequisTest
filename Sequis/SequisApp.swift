//
//  SequisApp.swift
//  Sequis
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import MainFeature
import CommonNetworking
import Impose

@main
struct SequisApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MainFeature.Module.shared)
        }
        .onChange(of: scenePhase) { newValue in
            print(newValue)
        }
    }
    
    init() {
        URLCache.shared.memoryCapacity = 52_428_800
        URLCache.shared.diskCapacity = 104_857_600
        Injector.shared.addTransient(for: MainAPI.self, CommonNetworking.Module.shared.mainAPI)
    }
}
