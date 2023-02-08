//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import CommonNetworking

public class MainServiceMock: MainAPI {
    
    public init() { }
    
    public var delay: Duration? = nil
    
    public var pageRequested: Int?
    public var itemsResult: Result<[Item], APIError> = .failure(.unexpectedStatusCode(-1))
    public func items(atPage page: Int) async -> Result<[CommonNetworking.Item], CommonNetworking.APIError> {
        self.pageRequested = page
        guard let delay else {
            return itemsResult
        }
        do {
            try await Task.sleep(for: delay)
            return itemsResult
        } catch {
            return itemsResult
        }
    }
}
