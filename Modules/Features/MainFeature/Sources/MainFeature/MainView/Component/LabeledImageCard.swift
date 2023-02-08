//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

// MARK: LabeledImageModel

struct LabeledImageModel: Identifiable {
    typealias ID = String
    
    let id: String
    let image: ImageConvertible
    let title: String
    let content: String
}

// MARK: LabeledImageCard

struct LabeledImageCard: View {
    
    let viewModel: LabeledImageModel
    
    init(viewModel: LabeledImageModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Card {
            HStack {
                ImageCompatible(viewModel.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .innerCornerRadius()
                VStack(alignment: .leading) {
                    Title2(viewModel.title)
                        .foregroundColor(.appPrimary)
                    Text(viewModel.content)
                        .defaultTextColor()
                    Spacer()
                }
                .padding()
                Spacer()
            }
            .padding()
        }
        .frame(height: 124)
    }
}

// MARK: LabeledImageCard_Previews

struct LabeledImageCard_Previews: PreviewProvider {
    static var previews: some View {
        LabeledImageCard(
            viewModel: .init(
                id: "test",
                image: Bundle.module.image(name: "Test"),
                title: "Author",
                content: "Amelia Earheart"
            )
        )
    }
}
