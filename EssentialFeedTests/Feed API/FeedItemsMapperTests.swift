//
//  RemoteFeedLoaderTest.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/11/30.
//

import XCTest
import EssentialFeed

class FeedItemsMapperTests: XCTestCase {
    
    func test_map_throwsErrorOnNon200HTTPResponse() throws {
        let sample = [199, 201, 300, 400, 500]
        let json = makeItemsJSON([])
        
        try sample.forEach { code in
            XCTAssertThrowsError(
                try FeedItemsMapper.map(json, from: HTTPURLResponse(statusCode: code))
            )
        }
    }
    
    func test_map_throwsErrorOn200HTTPResponseWithInvalidJSON() {
        let invalidJSON = Data("invalid json".utf8)
        
        XCTAssertThrowsError(
            try FeedItemsMapper.map(invalidJSON, from: HTTPURLResponse(statusCode: 200))
        )
    }
    
    func test_map_deliversNoItmesOn200HTTPResponseWithEmptyJSONList() throws {
        let emptyListJson = makeItemsJSON([])

        let result = try FeedItemsMapper.map(emptyListJson, from: HTTPURLResponse(statusCode: 200))
        XCTAssertEqual(result, [])
    }
    
    func test_map_deliversItemOn200HTTPResponseWithJSONItems() throws {
        let item1 = makeItem(
            id: UUID(),
            imageURL: URL(string: "http://a-url.com")!)
        
        let item2 = makeItem(
            id: UUID(),
            description: "a descriiption",
            location: "a location",
            imageURL: URL(string: "http://another-url.com")!)
        

        let items = [item1.model, item2.model]
        
        let json = makeItemsJSON([item1.json, item2.json])
        
        let result = try FeedItemsMapper.map(json, from: HTTPURLResponse(statusCode: 200))
        
        XCTAssertEqual(result, items)
    }
    
    //MARK: - Helpers
    private func makeItem(id: UUID, description: String? = nil, location: String? = nil, imageURL: URL) -> (model: FeedImage, json: [String: Any]) {
        let item = FeedImage(id: id, description: description, location: location, url: imageURL)
        let json = [
            "id": id.uuidString,
            "description": description,
            "location": location,
            "image": imageURL.absoluteString
        ].compactMapValues { $0 } // Get rid of optional
        
        // Below is old method. compactMap came out in Swift 5.
//            .reduce(into: [String: Any]()) { accumulate, element in
//            if let value = element.value { accumulate[element.key] = value }
//        }
        
        return (item, json)
    }
    
    
}
