//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation

public struct Post: Codable, Equatable {
    public let id, author, content: String
    public let time: Date
}
