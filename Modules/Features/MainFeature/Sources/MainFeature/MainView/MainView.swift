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
    
    @Published var labeledImages: [LabeledImageModel] = []
    
    init(items: [LabeledImageModel]) {
        self.labeledImages = items
    }
    
    // override this
    func onAppear(for item: LabeledImageModel) { }
    
    // override this
    func destination(for item: LabeledImageModel) -> some View {
        Text("Override this for navigation")
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
                ForEach(viewModel.labeledImages) { item in
                    NavigationLink(destination: viewModel.destination(for: item)) {
                        LabeledImageCard(
                            viewModel: item
                        ).onAppear {
                            viewModel.onAppear(for: item)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Image List")
        .navigationBarTitleDisplayMode(.large)
        .background(Color.appBackground)
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
