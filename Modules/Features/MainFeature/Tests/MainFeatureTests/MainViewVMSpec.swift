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
import CommonNetworking
import CommonNetworkingMock
@testable import MainFeature

class MainViewVMSpec: QuickSpec {
    override func spec() {
        var vmUnderTest: MainViewVM!
        var service: MainServiceMock!
        describe("success request") {
            beforeEach {
                service = MainServiceMock()
                service.itemsResult = .success(.fake(count: 30))
                Injector.shared.addSingleton(for: MainAPI.self, service)
                vmUnderTest = MainViewVM()
            }
            it("should automatically request first page") {
                await expect(service.pageRequested).toEventually(equal(0))
                await expect(vmUnderTest.labeledImages.count).toEventually(equal(30))
            }
            it("should append the labeledImages") {
                vmUnderTest.loadPage(1)
                await expect(service.pageRequested).toEventually(equal(1))
                await expect(vmUnderTest.labeledImages.count).toEventually(equal(60))
            }
        }
    }
}
