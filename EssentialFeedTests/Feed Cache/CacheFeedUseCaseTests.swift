//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/7.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deletedCachedFeedCallCounnt = 0
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deletedCachedFeedCallCounnt, 0)
    }
    
}
