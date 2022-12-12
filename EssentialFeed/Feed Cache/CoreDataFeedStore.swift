//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/9.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func deleteCacheFeed(completion: @escaping DeletionCompletion) {
    }
}
