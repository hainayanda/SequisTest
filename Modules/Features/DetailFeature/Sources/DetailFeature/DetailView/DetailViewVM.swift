//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import SwiftUI
import Impose
import CommonNetworking
import CommonUtilities

class DetailViewVM: DetailViewModel {
    @Injected private var service: DetailAPI
    private let item: Item
    private var isLoaded: Bool = false
    
    init(item: Item) {
        self.item = item
        super.init(image: URL(string: item.downloadURL), lists: [])
    }
    
    override func onLoaded() {
        guard !isLoaded else { return }
        isLoaded = true
        loadPost()
    }
    
    override func onDeleting(item: PostItemModel) {
        self.lists.removeAll { $0.id == item.id }
    }
    
    override func onAddingNewItem() {
        Task.detached { [weak self] in
            guard let self else { return }
            let result = await self.service.addNewItem()
            switch result {
            case .success(let post):
                RunLoop.main.perform { [weak self] in
                    self?.lists.insert(post.mapToPostItemModel(), at: 0)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadPost() {
        Task.detached { [weak self] in
            guard let self else { return }
            let result = await self.service.allPosts(for: self.item)
            switch result {
            case .success(let posts):
                RunLoop.main.perform { [weak self] in
                    self?.lists = posts.mapToPostItemModels()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

private extension Post {
    func mapToPostItemModel() -> PostItemModel {
        PostItemModel(id: id, name: author, content: content, footNote: time.relativeDateString)
    }
}

private extension Array where Element == Post {
    func mapToPostItemModels() -> [PostItemModel] {
        map { $0.mapToPostItemModel() }
    }
}
