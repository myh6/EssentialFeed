//
//  XCTestCase+FailableDeleteFeedStoreSpecs.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/9.
//

import XCTest
import EssentialFeed

extension FailableDeleteFeedStoreSpecs where Self: XCTestCase {
    func assertThatDeleteDeliversErrorOnDeletionError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        let deletionError = deleteCache(from: sut)
        
        XCTAssertNotNil(deletionError, "Expected cache deletion to fail with an error", file: file, line: line)
    }
    
    func assertThatDeleteHasNoSideEffectOnDeletionError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        deleteCache(from: sut)
        
        expect(sut, toRetrieve: .empty, file: file, line: line)
    }
}
