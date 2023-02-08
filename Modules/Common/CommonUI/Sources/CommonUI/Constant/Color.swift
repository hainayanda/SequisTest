//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

public extension Color {
    
    static var shadow: Color { .text.opacity(0.2) }
    
    static var foreground: Color {
        Color("foreground", bundle: .module)
    }
    
    static var text: Color {
        Color("text", bundle: .module)
    }
    
    static var primary: Color {
        Color("primary", bundle: .module)
    }
    
    static var secondary: Color {
        Color("secondary", bundle: .module)
    }
}
