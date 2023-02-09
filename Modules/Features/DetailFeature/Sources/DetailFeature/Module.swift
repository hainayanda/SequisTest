//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

// MARK: Factory

public protocol ModuleFactory {
    func createDetailView() -> DetailView
}

public class Module: ModuleFactory {
    
    public init() { }
    
    public func createDetailView() -> DetailView {
        DetailView(
            viewModel: DetailViewModel(
                image: URL(string: "https://zonneveld.dev/wp-content/uploads/2019/10/swiftUI-banner.jpg")
            )
        )
    }
}
