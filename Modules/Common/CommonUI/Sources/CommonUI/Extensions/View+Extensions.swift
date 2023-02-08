//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

public extension View {
    func defaultShadow() -> some View {
        shadow(color: .shadow, radius: 10)
    }
    
    func defaultCornerRadius() -> some View {
        cornerRadius(24)
    }
    
    func innerCornerRadius() -> some View {
        cornerRadius(20)
    }
    
    func defaultTextColor() -> some View {
        foregroundColor(.appText)
    }
}
