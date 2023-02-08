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
        Task {
            switch await service.items(atPage: page) {
            case .success(let items):
                self.page = page
                self.items.append(contentsOf: items.toLabelImageModels())
            case .failure(let reason):
                print(reason)
            }
            
        }
    }
}

private extension Array where Element == Item {
    func toLabelImageModels() -> [LabeledImageModel] {
        map { $0.toLabelImageModel() }
    }
}

private extension Item {
    func toLabelImageModel() -> LabeledImageModel {
        LabeledImageModel(id: id, image: URL(string: url), title: "Author", content: author)
    }
}
