//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import CommonNetworking

public class DetailServiceMock: DetailAPI {
    
    public init() { }
    
    public var delay: Duration? = nil
    
    public var itemUsed: Item?
    
    public var postResults: Result<[Post], APIError> = .failure(.unexpectedStatusCode(-1))
    public func allPosts(for item: Item) async -> Result<[Post], CommonNetworking.APIError> {
        self.itemUsed = item
        guard let delay else {
            return postResults
        }
        do {
            try await Task.sleep(for: delay)
            return postResults
        } catch {
            return postResults
        }
    }
    
    public var postResult: Result<Post, APIError> = .failure(.unexpectedStatusCode(-1))
    public func addNewPost(for item: Item) async -> Result<Post, APIError> {
        self.itemUsed = item
        guard let delay else {
            return postResult
        }
        do {
            try await Task.sleep(for: delay)
            return postResult
        } catch {
            return postResult
        }
    }
    
    public var postUsed: Post?
    public var deleteResult: Result<Bool, APIError> = .failure(.unexpectedStatusCode(-1))
    public func deletePost(for item: Item, post: Post) async -> Result<Bool, APIError> {
        self.itemUsed = item
        self.postUsed = post
        guard let delay else {
            return deleteResult
        }
        do {
            try await Task.sleep(for: delay)
            return deleteResult
        } catch {
            return deleteResult
        }
    }
    
}
