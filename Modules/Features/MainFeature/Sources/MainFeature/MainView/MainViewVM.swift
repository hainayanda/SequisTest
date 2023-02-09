//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import SwiftUI
import CommonUI
import Impose
import CommonNetworking
import CommonUtilities

class MainViewVM: MainViewModel {
    
    @Injected private var service: MainAPI
    private var router: MainViewRouting
    
    private var items: [Item] = []
    private var page: Int = 0
    
    init(router: MainViewRouting) {
        self.router = router
        super.init(items: [])
    }
    
    override func onLoaded() {
        guard page == 0 else { return }
        loadPage(page)
    }
    
    override func onAppear(for item: LabeledImageModel) {
        guard loadingState == .loaded,
              labeledImages.last?.id == item.id else {
            return
        }
        loadingState = .loading
        loadPage(page + 1)
    }
    
    override func destination(for item: LabeledImageModel) -> AnyView {
        guard let index = labeledImages.firstIndex(where: { $0.id == item.id }),
                let itemFound = items[safe: index] else {
            return AnyView(Text("Something Happened"))
        }
        return router.destination(for: itemFound)
    }
    
    func loadPage(_ page: Int) {
        Task.detached { [weak self] in
            guard let self = self else { return }
            switch await self.service.items(atPage: page) {
            case .success(let items):
                self.page = page
                self.items = items
                RunLoop.main.perform { [weak self] in
                    self?.labeledImages.append(contentsOf: items.mapLabelImageModels(page: page))
                    self?.loadingState = .loaded
                }
            case .failure(let reason):
                print(reason)
            }
        }
    }
}

private extension Array where Element == Item {
    func mapLabelImageModels(page: Int) -> [LabeledImageModel] {
        map { $0.mapLabelImageModel(page: page) }
    }
}

private extension Item {
    func mapLabelImageModel(page: Int) -> LabeledImageModel {
        LabeledImageModel(id: "\(page)_\(id)", image: URL(string: downloadURL), title: "Author", content: author)
    }
}
