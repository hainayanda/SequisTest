//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI
import CommonNetworking
import DetailFeature
import Impose

protocol MainViewRouting {
    func destination(for item: Item) -> AnyView
}

class MainViewRouter: MainViewRouting {
    
    @Injected var detailModule: DetailFeature.Module
    
    func destination(for item: Item) -> AnyView {
        AnyView(detailModule.createDetailView())
    }
}
