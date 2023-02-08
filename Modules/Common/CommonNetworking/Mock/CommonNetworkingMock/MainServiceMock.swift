//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 8/2/23.
//

import Foundation
import CommonNetworking

public class MainServiceMock: MainAPI {
    
    var delay: Duration? = nil
    
    var itemsResult: Result<[Item], APIError> = .failure(.unexpectedStatusCode(-1))
    public func items(atPage page: Int) async -> Result<[CommonNetworking.Item], CommonNetworking.APIError> {
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
