//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import Impose

public class Module: ModuleProvider {
    
    public init() { }
    
    public func provide(for injector: Injector) {
        injector.addTransient(for: MainAPI.self, MainService())
        injector.addTransient(for: DetailAPI.self, DetailService())
    }
}
