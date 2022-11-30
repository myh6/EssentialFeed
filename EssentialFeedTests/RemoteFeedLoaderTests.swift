//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/11/30.
//

import XCTest

class RemoteFeedLoader {
}

class HTTPClient {
    var requestedURL: URL?
}
class RemoteFeedLoaderTexts: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }
    
}

