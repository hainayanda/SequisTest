//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI

public struct Card<Content>: View where Content: View {
    
    let content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.appBackground)
            content()
        }
        .defaultCornerRadius()
        .defaultShadow()
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card {
            Text("Hello World")
        }
        .frame(width: 200, height: 100)
    }
}
