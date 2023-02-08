//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

// MARK: Factory

public class Module: ObservableObject {
    
    public static var shared: Module { Module() }
    
    public var mainAPI: MainAPI { MainService() }
}
