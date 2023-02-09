//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import Fakery
@testable import CommonNetworking

public extension Post {
    static func fake(_ faker: Faker = .init()) -> Post {
        Post(
            id: UUID().uuidString,
            author: faker.name.name(),
            content: faker.lorem.words(),
            time: Date()
        )
    }
}

public extension Array where Element == Post {
    static func fake(count: Int) -> [Post] {
        (0..<count).map { _ in Post.fake() }
    }
}
