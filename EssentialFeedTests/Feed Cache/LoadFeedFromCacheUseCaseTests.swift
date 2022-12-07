//
//  LoadFeedFromCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/7.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessage, [])
    }
    
    //MARK: - Helpers
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    private class FeedStoreSpy: FeedStore {
        
        private(set) var receivedMessage = [ReceivedMessage]()
        
        enum ReceivedMessage: Equatable {
            case deleteCachedFeed
            case insert([LocalFeedImage], Date)
        }
        
        private var deletionCompletion = [DeletionCompletion]()
        private var insertionCompletion = [InsertionCompletion]()
        
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
        
    }
}

