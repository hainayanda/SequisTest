//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import CommonUtilities

public protocol DetailAPI {
    func allPosts(for item: Item) async -> Result<[Post], APIError>
    func addNewItem() async -> Result<Post, APIError>
}

class DetailService: APICaller, DetailAPI {
    
    init() {}
    
    var baseUrl: String { "" }
    
    func allPosts(for item: Item) async -> Result<[Post], APIError> {
        do {
            return .success(try randomizePosts(count: Int.random(in: 10..<30)))
        } catch let apiError as APIError {
            return .failure(apiError)
        } catch {
            return .failure(.unexpectedStatusCode(-1))
        }
    }
    
    func addNewItem() async -> Result<Post, APIError> {
        do {
            guard let newItem = try randomizePosts(count: 1).first else {
                return .failure(.unexpectedStatusCode(-1))
            }
            return .success(newItem)
        } catch let apiError as APIError {
            return .failure(apiError)
        } catch {
            return .failure(.unexpectedStatusCode(-1))
        }
    }
}

private func randomizePosts(count: Int) throws -> [Post] {
    let firstNames = try getList(from: "firstNames")
    let lastNames = try getList(from: "lastNames")
    let nouns = try getList(from: "nouns")
    let verbs = try getList(from: "verbs")
    guard !firstNames.isEmpty, !lastNames.isEmpty, !nouns.isEmpty, !verbs.isEmpty else {
        throw APIError.unexpectedStatusCode(-1)
    }
    return try (0..<count).map { _ in
        try randomizePost(firstNames: firstNames, lastNames: lastNames, nouns: nouns, verbs: verbs)
    }
}

private func randomizePost(firstNames: [String], lastNames: [String], nouns: [String], verbs: [String]) throws -> Post {
    let words: Int = Int.random(in: 0..<10)
    let firstName = firstNames.randomElement()
    let lastName = lastNames.randomElement()
    let nounWords = nouns.random(nElements: words)
    let verbWords = verbs.random(nElements: words)
    guard let firstName, let lastName, let nounWords, let verbWords else {
        throw APIError.unexpectedStatusCode(-1)
    }
    
    let content = nounWords.combine(with: verbWords).joined(separator: " ")
    
    return Post(
        id: UUID().uuidString,
        author: "\(firstName) \(lastName)",
        content: content,
        time: Date.now.addingTimeInterval(-TimeInterval.random(in: 0..<600000))
    )
}

private func getList(from jsonName: String) throws -> [String] {
    guard let listPath = Bundle.module.path(forResource: jsonName, ofType: "json") else {
        throw APIError.unexpectedStatusCode(-1)
    }
    let data = try Data(contentsOf: URL(filePath: listPath), options: .mappedIfSafe)
    guard let result = try JSONSerialization.jsonObject(with: data) as? [String] else {
        throw APIError.unexpectedStatusCode(-1)
    }
    return result
}

private extension Array {
    
    func combine(with anotherArray: [Element]) -> [Element] {
        var results: [Element] = []
        enumerated().forEach { (index, element) in
            results.append(element)
            guard let otherElement = anotherArray[safe: index] else { return }
            results.append(otherElement)
        }
        return results
    }
    
    func random(nElements count: Int) -> [Element]? {
        var randoms: [Element] = []
        for _ in (0..<count) {
            guard let element = randomElement() else {
                return nil
            }
            randoms.append(element)
        }
        return randoms
    }
}
