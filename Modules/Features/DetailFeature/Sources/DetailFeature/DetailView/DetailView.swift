//
//  SwiftUIView.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import SwiftUI
import CommonUI

// MARK: DetailViewModel

class DetailViewModel: ObservableObject {
    
    let image: ImageConvertible
    @Published var lists: [PostItemModel]
    
    init(image: ImageConvertible, lists: [PostItemModel]) {
        self.image = image
        self.lists = lists
    }
    
    // override this
    func onDeleting(item: PostItemModel) { }
    
    // override this
    func onAddingNewItem() { }
}

struct Number: Identifiable {
    let id: Int
}

public struct DetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            ImageCompatible(viewModel.image)
                .resizable()
                .scaledToFit()
            List {
                ForEach(viewModel.lists) { item in
                    PostItem(viewModel: item)
                        .swipeActions(edge: .trailing) {
                            Button {
                                viewModel.onDeleting(item: item)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.orange)
                        }
                }
                
            }
            .listStyle(.plain)
        }
        .navigationTitle("Image Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                viewModel.onAddingNewItem()
            } label: {
                Label("Add", systemImage: "plus")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
            viewModel: DetailViewModel(
                image: URL(string: "https://zonneveld.dev/wp-content/uploads/2019/10/swiftUI-banner.jpg"), lists: (0..<20).map {
                    PostItemModel(
                        id: "\($0)",
                        name: "Nayanda Haberty",
                        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        footNote: "yesterday"
                    )
                }
            )
        )
    }
}
