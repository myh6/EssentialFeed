//
//  FeedStoreSpecs.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/9.
//

import Foundation

protocol FeedStoreSpecs {
    func test_retrieve_deliversEmptyOnEmptyCache()
    func test_retrieve_hasNoSideEffectOnEmptyCache()
    func test_retrieve_deliversFoundValuesOnNonEmptyCache()
    func test_retrieve_hasNoSideEffectsOnNonEmptyCache()
    
    func test_insert_overridesPreiouslyInsertedCacheValues()
    
    func test_storeSideEffects_runSerially()
}

protocol FailableRetrieveFeedStoreSpecs: FeedStoreSpecs {
    func test_retrieve_deliversFailureOnRetrievalError()
    func test_retrieve_hasNoSideEffectsOnFailure()
}

protocol FailableInsertFeedStoreSpecs: FeedStoreSpecs {
    func test_insert_deliversErrorOnInsertionError()
    func test_insert_hasNoSideEffectOnInsertionError()
}

protocol FailableDeleteFeedStoreSpecs: FeedStoreSpecs {
    func test_delete_deliversErrorOnDeletionError()
    func test_delete_hasNoSideEffectOnDeletionError()
}

typealias FailableFeedStore = FailableRetrieveFeedStoreSpecs & FailableInsertFeedStoreSpecs & FailableDeleteFeedStoreSpecs

