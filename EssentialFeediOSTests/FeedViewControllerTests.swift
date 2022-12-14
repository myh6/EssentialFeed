//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Min-Yang Huang on 2022/12/14.
//

import XCTest

final class FeeViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {
        
    }
}

final class FeedViewControllerTests: XCTestCase {
    
    func test_init_doesNoLoadFeed() {
        let loader = LoaderSpy()
        _ = FeeViewController(loader: loader)
        
        XCTAssertEqual(loader.loadCallCount, 0)
    }
    
    //MARK: - Helpers
    
    class LoaderSpy {
        private(set) var loadCallCount: Int = 0
    }
    
}
