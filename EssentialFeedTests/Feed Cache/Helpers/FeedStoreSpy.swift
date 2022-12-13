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
    
    private var deletionCompletion = [DeletionCompletion]()
    private var insertionCompletion = [InsertionCompletion]()
    private var retrieveCompletion = [RetrievalCompletion]()
    
    func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        deletionCompletion.append(completion)
        receivedMessage.append(.deleteCachedFeed)
    }
    
    func completeDeletion(with error: Error, at index: Int = 0) {
        deletionCompletion[index](error)
    }
    
    func completeDeletionSuccessfully(at index: Int = 0) {
        deletionCompletion[index](nil)
    }
    
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        insertionCompletion.append(completion)
        receivedMessage.append(.insert(feed, timestamp))
    }
    
    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletion[index](error)
    }
    
    func completeInsertionSuccessfully(at index: Int = 0) {
        insertionCompletion[index](nil)
    }
    
    func retrieve(completion: @escaping RetrievalCompletion) {
        retrieveCompletion.append(completion)
        receivedMessage.append(.retrieve)
    }
    
    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrieveCompletion[index](.failure(error))
    }
    
    func completeRetrievalWithEmptyCache(at index: Int = 0) {
        retrieveCompletion[index](.empty)
    }
    
    func completeRetrieval(with feed: [LocalFeedImage], timestamp: Date, at index: Int = 0) {
        retrieveCompletion[index](.found(feed: feed, timestamp: timestamp))
    }
}
