//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

// MARK: MainViewModel

protocol CardItem: Identifiable {
    var image: ImageConvertible { get }
    var title: String { get }
    var content: String { get }
}

class MainViewModel: ObservableObject {
    @Published private(set) var items: [any CardItem] = []
}

struct MainView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 24) {
                LabeledImageCard(
                    viewModel: .init(
                        image: Bundle.module.image(name: "Test"),
                        title: "Author",
                        content: "Amelia Earheart"
                    )
                )
                LabeledImageCard(
                    viewModel: .init(
                        image: Bundle.module.image(name: "Test"),
                        title: "Author",
                        content: "Amelia Earheart"
                    )
                )
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
