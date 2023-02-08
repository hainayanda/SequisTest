//
//  ContentView.swift
//  Sequis
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import MainFeature

struct ContentView: View {
    
    @EnvironmentObject var mainModule: MainFeatureModule
    
    var body: some View {
        NavigationView {
            mainModule.createMainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MainFeatureModule.shared)
    }
}
