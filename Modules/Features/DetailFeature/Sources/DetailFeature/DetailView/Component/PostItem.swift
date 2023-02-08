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
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                    Text("MM")
                        .foregroundColor(.appConstrastText)
                        .bold()
                }
                Spacer()
            }
            .frame(width: 64)
            VStack(alignment: .leading, spacing: 8) {
                Title2("Author")
                    .foregroundColor(.appText)
                Text("Hello")
                    .foregroundColor(.appText)
                Spacer()
                FootNote("yesterday")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .frame(minHeight: 124)
        .overlay {
            VStack {
                Spacer()
                Rectangle()
                    .foregroundColor(.shadow)
                    .frame(height: 1)
            }
            .padding(.leading, 24)
        }
    }
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem()
            .frame(height: 124)
        
    }
}
