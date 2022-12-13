//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/7.
//

import Foundation



public enum CachedFeed {
    case empty
    case found(feed: [LocalFeedImage], timestamp: Date)
}

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    typealias RetrievealResult = Result<CachedFeed, Error>
    typealias RetrievalCompletion = (RetrievealResult) -> Void

    func deleteCacheFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
