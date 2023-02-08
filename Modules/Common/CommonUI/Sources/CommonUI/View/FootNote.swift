//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI

public struct FootNote: View {
    
    let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.footnote)
    }
}

struct FootNote_Previews: PreviewProvider {
    static var previews: some View {
        FootNote("Hello World")
    }
}
