//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import SwiftUI
import CommonNetworking

public protocol DetailFeatureModuleFactory {
    func createDetailView(for item: Item) -> AnyView
}
