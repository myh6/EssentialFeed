//
//  FeedImageDataStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2023/1/11.
//

import Foundation
import EssentialFeed

class FeedImageDataStoreSpy: FeedImageDataStore {
    enum Message: Equatable {
        case retrieve(dataFor: URL)
        case insert(data: Data, for: URL)
    }
    
    private var retrievalCompletions = [(FeedImageDataStore.RetrievalResult) -> Void]()
    private var insertionCompletions = [(FeedImageDataStore.InsertionResult) -> Void]()
    private(set) var receivedMessage = [Message]()
    
    func insert(_ data: Data, for url: URL, completion: @escaping (InsertionResult) -> Void) {
        receivedMessage.append(.insert(data: data, for: url))
        insertionCompletions.append(completion)
    }
    
    func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        receivedMessage.append(.retrieve(dataFor: url))
        retrievalCompletions.append(completion)
    }
    
    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](.failure(error))
    }
    
    func completeInsertionSuccessfully(at index: Int = 0) {
        insertionCompletions[index](.success(()))
    }
    
    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }
    
    func completeRetrieval(with data: Data?, at index: Int = 0) {
        retrievalCompletions[index](.success(data))
    }
}
