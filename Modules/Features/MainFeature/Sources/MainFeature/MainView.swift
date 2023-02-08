//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

// MARK: MainViewModel

class MainViewModel: ObservableObject {
    @Published private(set) var items: [LabeledImageModel] = []
    
    init(items: [LabeledImageModel]) {
        self.items = items
    }
}

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 24) {
                ForEach(viewModel.items) { item in
                    LabeledImageCard(
                        viewModel: item
                    )
                }
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            viewModel: MainViewModel(
                items: (0..<20).map {
                    LabeledImageModel(
                        id: "\($0)",
                        image: Bundle.module.image(name: "Test"),
                        title: "Author",
                        content: "Amelia Earheart"
                    )
                }
            )
        )
    }
}
