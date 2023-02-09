//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation

public extension Date {
    
    var relativeDateString: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: .now)
    }
}
