//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

public extension Bundle {
    func image(name: String) -> ImageConvertible {
        BundleImage(name: name, bundle: self)
    }
}
