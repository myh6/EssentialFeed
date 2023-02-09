//
//  NullStore.swift
//  EssentialApp
//
//  Created by Min-Yang Huang on 2023/2/7.
//

import Foundation
import EssentialFeed

class NullStore: FeedStore {
    func deleteCacheFeed() throws {}
    
    func insert(_ feed: [EssentialFeed.LocalFeedImage], timestamp: Date) throws {}
    
    func retrieve() throws -> CachedFeed? { .none }
}

extension NullStore: FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws {}
    
    func retrieve(dataForURL url: URL) throws -> Data? { .none }
}
