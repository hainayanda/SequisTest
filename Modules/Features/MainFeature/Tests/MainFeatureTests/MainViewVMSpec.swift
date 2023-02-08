//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import Quick
import Nimble
@testable import MainFeature

class MainViewVMSpec: QuickSpec {
    override func spec() {
        var vmUnderTest: MainViewVM!
        beforeEach {
            vmUnderTest = MainViewVM()
        }
        it("should fail") {
            fail()
        }
    }
}
