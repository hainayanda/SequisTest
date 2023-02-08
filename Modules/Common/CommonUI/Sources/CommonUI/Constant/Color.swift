//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

public extension Color {
    
    static var shadow: Color { .appText.opacity(0.2) }
    
    static var appBackground: Color {
        Color("foreground", bundle: .module)
    }
    
    static var appText: Color {
        Color("text", bundle: .module)
    }
    
    static var appPrimary: Color {
        Color("primary", bundle: .module)
    }
    
    static var appSecondary: Color {
        Color("secondary", bundle: .module)
    }
    
    static var appTertiary: Color {
        Color("tertiary", bundle: .module)
    }
}
