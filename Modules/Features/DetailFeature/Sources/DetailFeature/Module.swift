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
                image: URL(string: "https://zonneveld.dev/wp-content/uploads/2019/10/swiftUI-banner.jpg"), lists: (0..<20).map {
                    PostItemModel(
                        id: "\($0)",
                        name: "Nayanda Haberty",
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        footNote: "yesterday"
                    )
                }
            )
        )
    }
}
