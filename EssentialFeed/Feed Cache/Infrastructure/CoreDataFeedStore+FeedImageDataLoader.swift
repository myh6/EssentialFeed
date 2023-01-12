//
//  CoreDataFeedStore+FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/12.
//

import Foundation

extension CoreDataFeedStore: FeedImageDataStore {
    
    public func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void) {
    }
    
    public func retrieve(dataForURL url: URL, completion: @escaping (RetrievalResult) -> Void) {
        completion(.success(.none))
    }
}
