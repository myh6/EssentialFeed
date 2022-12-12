//
//  CoreDataFeedStoreTests.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/9.
//

import XCTest
import EssentialFeed

class CoreDataFeedStoreTests: XCTestCase, FeedStoreSpecs {
    
    func test_retrieve_deliversEmptyOnEmptyCache() {
        let sut = makeSUT()
        assertThatRetrieveDeliversEmptyOnEmptyCache(on: sut)
    }
    
    func test_retrieve_hasNoSideEffectOnEmptyCache() {
        let sut = makeSUT()
        assertThatRetrieveHasNoSideEffectsOnEmptyCache(on: sut)
    }
    
    func test_retrieve_deliversFoundValuesOnNonEmptyCache() {
        
    }
    
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache() {
        
    }
    
    func test_retrieve_deliversFailureOnRetrievalError() {}
    func test_retrieve_hasNoSideEffectsOnFailure() {}
    
    func test_insert_overridesPreiouslyInsertedCacheValues() {
        
    }
    
    func test_insert_deliversErrorOnInsertionError() {}
    func test_insert_hasNoSideEffectOnInsertionError() {}
    
    func test_delete_deliversErrorOnDeletionError() {}
    func test_delete_hasNoSideEffectOnDeletionError() {}
    
    func test_storeSideEffects_runSerially() {
        
    }
    
    //MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> CoreDataFeedStore {
        let storeBundle = Bundle(for: CoreDataFeedStore.self)
        let sut = try! CoreDataFeedStore(bundle: storeBundle)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
    
}
