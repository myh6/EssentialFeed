//
//  FeedImageDataMapperTests.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2023/2/7.
//

import XCTest
import EssentialFeed

class FeedImageDataMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let sample = [199, 201, 300, 400, 500]
        
        try sample.forEach { code in
            XCTAssertThrowsError(
                try FeedImageDataMapper.map(anyData(), from: HTTPURLResponse(statusCode: code))
            )
        }
    }

    func test_map_deliversInvalidDataErrorOn200HTTPResponseWithEmptyData() throws {
        let emptyData = Data()

        XCTAssertThrowsError(
            try FeedImageDataMapper.map(emptyData, from: HTTPURLResponse(statusCode: 200))
        )
    }

    func test_map_deliversDataOn200HTTPResponse() throws {
        let nonEmptyData = Data("non-empty data".utf8)
        
        let result = try FeedImageDataMapper.map(nonEmptyData, from: HTTPURLResponse(statusCode: 200))

        XCTAssertEqual(result, nonEmptyData)
    }
}
