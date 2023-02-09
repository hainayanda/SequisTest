//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
@testable import DetailFeature
import Quick
import Nimble
import CommonNetworkingMock
import CommonNetworking
import Impose

class DetailViewVMSpec: QuickSpec {
    override func spec() {
        var item: Item!
        var vmUnderTest: DetailViewVM!
        var service: DetailServiceMock!
        describe("success request") {
            beforeEach {
                item = .fake()
                service = DetailServiceMock()
                service.deleteResult = .success(true)
                service.postResults = .success(.fake(count: 30))
                service.postResult = .success(.fake())
                Injector.shared.addSingleton(for: DetailAPI.self, service)
                vmUnderTest = DetailViewVM(item: item)
            }
            it("should automatically request all post") {
                vmUnderTest.onLoaded()
                await expect(service.itemUsed).toEventually(equal(item))
                await expect(vmUnderTest.lists.count).toEventually(equal(30))
            }
            it("should delete selected item") {
                vmUnderTest.onLoaded()
                await expect(vmUnderTest.lists.isEmpty).toEventually(beFalse())
                let deleted = vmUnderTest.lists.first!
                vmUnderTest.onDeleting(item: deleted)
                await expect(vmUnderTest.lists.contains(deleted)).toEventually(beFalse())
            }
            it("should add new item") {
                vmUnderTest.onAddingNewItem()
                await expect(vmUnderTest.lists.isEmpty).toEventually(beFalse())
            }
        }
    }
}
