//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

public extension Color {
    static var shadow: Color { .black.opacity(0.2) }
    static var foreground: Color {
        Color("foreground", bundle: .module)
    }
}
