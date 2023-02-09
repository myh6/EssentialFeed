//
//  FeedStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/7.
//

import Foundation
import EssentialFeed

class FeedStoreSpy: FeedStore {
    
    private(set) var receivedMessage = [ReceivedMessage]()
    
    enum ReceivedMessage: Equatable {
        case deleteCachedFeed
        case insert([LocalFeedImage], Date)
        case retrieve
    }

    private var deletionResult: Result<Void, Error>?
    private var insertionResult: Result<Void, Error>?
    private var retrievalResult: Result<CachedFeed?, Error>?
    
    func deleteCacheFeed() throws {
        receivedMessage.append(.deleteCachedFeed)
        try deletionResult?.get()
    }
    
    func completeDeletion(with error: Error) {
        deletionResult = .failure(error)
    }
    
    func completeDeletionSuccessfully() {
        deletionResult = .success(())
    }
    
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws {
        receivedMessage.append(.insert(feed, timestamp))
        try insertionResult?.get()
    }
    
    func completeInsertion(with error: Error) {
        insertionResult = .failure(error)
    }
    
    func completeInsertionSuccessfully() {
        insertionResult = .success(())
    }
    
    func retrieve() throws -> CachedFeed? {
        receivedMessage.append(.retrieve)
        return try retrievalResult?.get()
    }
    
    func completeRetrieval(with error: Error) {
        retrievalResult = .failure(error)
    }
    
    func completeRetrievalWithEmptyCache() {
        retrievalResult = .success(.none)
    }
    
    func completeRetrieval(with feed: [LocalFeedImage], timestamp: Date) {
        retrievalResult = .success(CachedFeed(feed: feed, timestamp: timestamp))
    }
}
