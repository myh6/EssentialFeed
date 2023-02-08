//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/11.
//

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
    
    // Combine
    // func retrieve(dataForURL url: URL) -> AnyPubisher<Data?, Error>
    
    // completionHandler asynchronous
    // @available(*, deprecated)
    // func retrieve(dataForURL url: URL, completion: @escaping (RetrievalResult) -> Void)
}
