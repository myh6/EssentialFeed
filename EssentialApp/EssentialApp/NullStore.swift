//
//  NullStore.swift
//  EssentialApp
//
//  Created by Min-Yang Huang on 2023/2/7.
//

import Foundation
import EssentialFeed

class NullStore: FeedStore {
    func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        completion(.success(()))
    }
    
    func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        completion(.success(()))
    }
    
    func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.success(.none))
    }
}

extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {
    }
    
    func retrieve(dataForURL url: URL) throws -> Data? {
        .none
    }
}
