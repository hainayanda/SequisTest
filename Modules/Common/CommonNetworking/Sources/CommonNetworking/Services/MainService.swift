//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

public protocol MainAPI {
    func items(atPage page: Int) async -> Result<[Item], APIError>
}

public class MainService: APICaller, MainAPI {
    
    public init() {}
    
    var baseUrl: String { "https://picsum.photos/v2" }
    
    public func items(atPage page: Int) async -> Result<[Item], APIError> {
        await httpGet(for: "list?page=\(page)")
    }
}
