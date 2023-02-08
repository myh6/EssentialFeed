//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/11.
//

public protocol FeedImageDataStore {
    typealias RetrievalResult = Swift.Result<Data?, Error>
    typealias InsertionResult = Swift.Result<Void, Error>
    
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
    
    // Combine
    // func retrieve(dataForURL url: URL) -> AnyPubisher<Data?, Error>
    
    // completionHandler asynchronous
    @available(*, deprecated)
    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void)
    @available(*, deprecated)
    func retrieve(dataForURL url: URL, completion: @escaping (RetrievalResult) -> Void)
}

public extension FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {
        let group = DispatchGroup()
        group.enter()
        var result: InsertionResult!
        insert(data, for: url) {
            result = $0
            group.leave()
        }
        group.wait()
        return try result.get()
    }
    
    func retrieve(dataForURL url: URL) throws -> Data? {
        let group = DispatchGroup()
        group.enter()
        var result: RetrievalResult!
        retrieve(dataForURL: url, completion: {
            result = $0
            group.leave()
        })
        group.wait()
        return try result.get()
    }
    
    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void) {}
    func retrieve(dataForURL url: URL, completion: @escaping (RetrievalResult) -> Void) {}
}
