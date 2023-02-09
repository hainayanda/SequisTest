//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

struct PostItem: View {
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                CircledInitial("Nayanda Haberty")
                Spacer()
            }
            .frame(width: 64)
            
            VStack(alignment: .leading, spacing: 8) {
                Title2("Author")
                    .foregroundColor(.appText)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .foregroundColor(.appText)
                FootNote("yesterday")
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem()
        
    }
}
