//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import Quick
import Nimble
import Impose
import SwiftUI
import CommonNetworking
import CommonNetworkingMock
@testable import MainFeature

class MainViewVMSpec: QuickSpec {
    override func spec() {
        var vmUnderTest: MainViewVM!
        var service: MainServiceMock!
        var router: MainViewRouterMock!
        describe("success request") {
            beforeEach {
                service = MainServiceMock()
                service.itemsResult = .success(.fake(count: 30))
                Injector.shared.addSingleton(for: MainAPI.self, service)
                router = MainViewRouterMock()
                vmUnderTest = MainViewVM(router: router)
            }
            it("should automatically request first page") {
                vmUnderTest.onLoaded()
                await expect(service.pageRequested).toEventually(equal(0))
                await expect(vmUnderTest.labeledImages.count).toEventually(equal(30))
            }
            it("should append the labeledImages") {
                vmUnderTest.onLoaded()
                vmUnderTest.loadPage(1)
                await expect(service.pageRequested).toEventually(equal(1))
                await expect(vmUnderTest.labeledImages.count).toEventually(equal(60))
            }
            it("should route to the selected item") {
                vmUnderTest.onLoaded()
                await expect(vmUnderTest.labeledImages.isEmpty).toEventually(beFalse())
                let item = vmUnderTest.labeledImages.first!
                _ = vmUnderTest.destination(for: item)
                expect(router.routingItem?.id).to(equal(item.id))
            }
        }
    }
}

private class MainViewRouterMock: MainViewRouting {
    
    var routingItem: Item?
    func destination(for item: CommonNetworking.Item) -> AnyView {
        routingItem = item
        return AnyView(Text("This is Dummy"))
    }
}
