//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

struct PostItemModel: Identifiable {
    typealias ID = String
    
    let id: String
    let name: String
    let content: String
    let footNote: String
}

struct PostItem: View {
    
    let viewModel: PostItemModel
    
    init(viewModel: PostItemModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                CircledInitial(viewModel.name)
                Spacer()
            }
            .frame(width: 64)
            
            VStack(alignment: .leading, spacing: 8) {
                Title2(viewModel.name)
                    .foregroundColor(.appText)
                Text(viewModel.content)
                    .foregroundColor(.appText)
                FootNote(viewModel.footNote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem(
            viewModel: PostItemModel(
                id: "1",
                name: "Nayanda Haberty",
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                footNote: "yesterday"
            )
        )
        
    }
}
