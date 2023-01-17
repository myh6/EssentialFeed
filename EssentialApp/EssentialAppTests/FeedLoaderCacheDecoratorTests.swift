//
//  FeedLoaderCacheDecoratorTests.swift
//  EssentialAppTests
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import XCTest
import EssentialFeed

class FeedLoaderCacheDecorator: FeedLoader {
    private let decoratee: FeedLoader
    
    init(decoratee: FeedLoader) {
        self.decoratee = decoratee
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        decoratee.load(completion: completion)
    }
}

final class FeedLoaderCacheDecoratorTests: XCTestCase, FeedLoaderTestCase {
    
    func test_load_deliversFeedOnLoaderSuccess() {
        let feed = uniqueFeed()
        let sut = makeSUT(loaderReesult: .success(feed))
        
        expect(sut, toCompleteWith: .success(feed))
    }
    
    func test_load_deliversErrorOnLoaderFailure() {
        let sut = makeSUT(loaderReesult: .failure(anyNSError()))
        
        expect(sut, toCompleteWith: .failure(anyNSError()))
    }
    
    //MARK: - Helpers
    private func makeSUT(loaderReesult: FeedLoader.Result, file: StaticString = #file, line: UInt = #line) -> FeedLoaderCacheDecorator {
        let loader = FeedLoaderStub(result: loaderReesult)
        let sut = FeedLoaderCacheDecorator(decoratee: loader)
        trackForMemoryLeaks(loader, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return sut
    }
}
