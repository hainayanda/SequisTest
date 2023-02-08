//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import Fakery
@testable import CommonNetworking

public extension Item {
    static func fake(_ faker: Faker = .init()) -> Item {
        Item(
            id: UUID().uuidString,
            author: faker.name.name(),
            width: Int.random(in: 10..<20),
            height: Int.random(in: 10..<20),
            url: faker.internet.url(),
            downloadURL: faker.internet.url()
        )
    }
}

public extension Array where Element == Item {
    static func fake(count: Int) -> [Item] {
        (0..<count).map { _ in Item.fake() }
    }
}
