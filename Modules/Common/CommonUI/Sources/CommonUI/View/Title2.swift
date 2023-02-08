//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI

public struct Title2: View {
    
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.title2)
            .bold()
    }
}

struct Title2_Previews: PreviewProvider {
    static var previews: some View {
        Title2("Hello World")
    }
}
