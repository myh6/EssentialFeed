//
//  EssentialAppUIAcceptanceTests.swift
//  EssentialAppUIAcceptanceTests
//
//  Created by Min-Yang Huang on 2023/1/18.
//

import XCTest
import EssentialFeed
import EssentialApp

final class EssentialAppUIAcceptanceTests: XCTestCase {

    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()
        
        app.launch()
        
        let feedCells = app.cells.matching(identifier: "FeedImageCell")
        
        XCTAssertEqual(feedCells.count, 22)
        
        let firstImage = app.images.matching(identifier: "FeedImageView").firstMatch
        XCTAssertTrue(firstImage.exists)
    }
}
