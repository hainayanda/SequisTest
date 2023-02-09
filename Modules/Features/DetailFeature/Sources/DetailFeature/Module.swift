//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI
import CommonNetworking
import SharedFeatureDependencies

// MARK: Abstract Factory

public class Module: DetailFeatureModuleFactory {
    
    public init() { }
    
    public func createDetailView(for item: Item) -> AnyView {
        let detailView = DetailView(viewModel: DetailViewVM(item: item))
        return AnyView(detailView)
    }
}
