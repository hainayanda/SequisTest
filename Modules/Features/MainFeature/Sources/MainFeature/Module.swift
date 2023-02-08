//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

// MARK: Factory

public class Module: ObservableObject {
    
    public init() { }
    
    public func createMainView() -> MainView {
        MainView(
            viewModel: MainViewVM()
        )
    }
}
