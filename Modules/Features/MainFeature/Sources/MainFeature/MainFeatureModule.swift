//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

// MARK: Factory

public class MainFeatureModule: ObservableObject {
    
    public static var shared: MainFeatureModule { MainFeatureModule() }
    
    public func createMainView() -> MainView {
        MainView(
            viewModel: MainViewModel(
                items: (0..<20).map {
                    LabeledImageModel(
                        id: "\($0)",
                        image: Bundle.module.image(name: "Test"),
                        title: "Author",
                        content: "Amelia Earheart"
                    )
                }
            )
        )
    }
}
