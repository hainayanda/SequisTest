//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

// MARK: Abstract Factory

public class Module: ObservableObject {
    
    public init() { }
    
    public func createMainView() -> AnyView {
        let router = MainViewRouter()
        let vm = MainViewVM(router: router)
        return AnyView(MainView(viewModel: vm))
    }
}
