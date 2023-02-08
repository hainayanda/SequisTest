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
    
    // override this
    func onAppear(for item: LabeledImageModel) {
        guard item.id == items.last?.id else { return }
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.items.append(
                LabeledImageModel(
                    id: "\(Int.random(in: 1000..<2000))",
                    image: Bundle.module.image(name: "Test"),
                    title: "Author",
                    content: "Karen Armstrong"
                )
            )
        }
    }
}

// MARK: MainView

public struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 24) {
                ForEach(viewModel.items) { item in
                    LabeledImageCard(
                        viewModel: item
                    )
                    .onAppear {
                        viewModel.onAppear(for: item)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Image List")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: MainView_Previews

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
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
}
