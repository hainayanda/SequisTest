//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation

public protocol MainAPI {
    func item(at page: Int) async -> Result<[Item], APIError>
}

class MainService: APICaller, MainAPI {
    
    init() {}
    
    var baseUrl: String { "https://picsum.photos/v2" }
    
    func item(at page: Int) async -> Result<[Item], APIError> {
        await httpGet(for: "list?page=\(page)")
    }
}
