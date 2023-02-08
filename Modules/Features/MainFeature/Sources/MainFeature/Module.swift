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
        let router = MainViewRouter()
        let vm = MainViewVM(router: router)
        return MainView(viewModel: vm)
    }
}
