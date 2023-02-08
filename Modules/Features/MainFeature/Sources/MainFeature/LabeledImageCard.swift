//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

// MARK: LabeledImageModel

class LabeledImageModel: ObservableObject {
    @Published var image: ImageConvertible
    @Published var title: String
    @Published var content: String
    
    init(image: ImageConvertible, title: String, content: String) {
        self.image = image
        self.title = title
        self.content = content
    }
}

// MARK: LabeledImageCard

struct LabeledImageCard: View {
    
    @ObservedObject var viewModel: LabeledImageModel
    
    init(viewModel: LabeledImageModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Card {
            HStack {
                ImageCompatible(viewModel.image)
                    .resizable()
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
                image: Bundle.module.image(name: "Test"),
                title: "Author",
                content: "Amelia Earheart"
            )
        )
    }
}
