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
    
    init(image: ImageConvertible) {
        self.image = image
    }
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
                    ForEach(0..<20) { _ in
                        PostItem()
                            .swipeActions(edge: .trailing) {
                                Button {
                                    print("Message deleted")
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
                print("Message Added")
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
                image: URL(string: "https://zonneveld.dev/wp-content/uploads/2019/10/swiftUI-banner.jpg")
            )
        )
    }
}
