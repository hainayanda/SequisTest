//
//  File.swift
//  
//
//  Created by Nayanda Haberty on 9/2/23.
//

import Foundation
import CommonUtilities
import RealmSwift

public protocol DetailAPI {
    func allPosts(for item: Item) async -> Result<[Post], APIError>
    func addNewPost(for item: Item) async -> Result<Post, APIError>
}

class DetailService: APICaller, DetailAPI {
    
    init() {}
    
    var baseUrl: String { "" }
    
    @MainActor
    func allPosts(for item: Item) async -> Result<[Post], APIError> {
        do {
            let realm = try await Realm()
            let results = realm.objects(PersistentPost.self).where { $0.itemId == item.id }
            return .success(results.mapToPosts())
        } catch let apiError as APIError {
            return .failure(apiError)
        } catch {
            return .failure(.unexpectedStatusCode(-1))
        }
    }
    
    @MainActor
    func addNewPost(for item: Item) async -> Result<Post, APIError> {
        do {
            let newItem = try randomizePost()
            let realm = try await Realm()
            try realm.write {
                realm.add(PersistentPost(item: item, post: newItem))
            }
            return .success(newItem)
        } catch let apiError as APIError {
            return .failure(apiError)
        } catch {
            return .failure(.unexpectedStatusCode(-1))
            
        }
    }
}

// MARK: Service Simulation

class PersistentPost: Object {
    @Persisted var itemId: String
    @Persisted(primaryKey: true) var id: String
    @Persisted var author: String
    @Persisted var content: String
    @Persisted var time: Date
}

extension PersistentPost {
    convenience init(item: Item, post: Post) {
        self.init()
        self.itemId = item.id
        self.id = post.id
        self.author = post.author
        self.content = post.content
        self.time = post.time
    }
    
    func mapToPost() -> Post {
        Post(id: id, author: author, content: content, time: time)
    }
}

extension Results where Element == PersistentPost {
    func mapToPosts() -> [Post] {
        map { $0.mapToPost() }
    }
}

private func randomizePost() throws -> Post {
    let firstNames = try getList(from: "firstNames")
    let lastNames = try getList(from: "lastNames")
    let nouns = try getList(from: "nouns")
    let verbs = try getList(from: "verbs")
    guard !firstNames.isEmpty, !lastNames.isEmpty, !nouns.isEmpty, !verbs.isEmpty else {
        throw APIError.unexpectedStatusCode(-1)
    }
    return try randomizePost(firstNames: firstNames, lastNames: lastNames, nouns: nouns, verbs: verbs)
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
        time: Date.now
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
