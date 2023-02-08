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
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .foregroundColor(.appText)
                FootNote("yesterday")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
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
