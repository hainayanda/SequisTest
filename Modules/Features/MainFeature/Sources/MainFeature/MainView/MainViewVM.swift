//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI
import Impose
import CommonNetworking

class MainViewVM: MainViewModel {
    
    @Injected var service: MainAPI
    private var page: Int = 0
    
    init() {
        super.init(items: [])
        loadPage(0)
    }
    
    override func onAppear(for item: LabeledImageModel) {
        guard items.last?.id == item.id else { return }
        loadPage(page + 1)
    }
    
    func loadPage(_ page: Int) {
        Task.detached { [weak self] in
            guard let self = self else { return }
            switch await self.service.items(atPage: page) {
            case .success(let items):
                self.page = page
                RunLoop.main.perform {
                    self.items.append(contentsOf: items.toLabelImageModels(page: page))
                }
            case .failure(let reason):
                print(reason)
            }
        }
    }
}

private extension Array where Element == Item {
    func toLabelImageModels(page: Int) -> [LabeledImageModel] {
        map { $0.toLabelImageModel(page: page) }
    }
}

private extension Item {
    func toLabelImageModel(page: Int) -> LabeledImageModel {
        LabeledImageModel(id: "\(page)_\(id)", image: URL(string: downloadURL), title: "Author", content: author)
    }
}
