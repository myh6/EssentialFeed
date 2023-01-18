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
        
        XCTAssertEqual(app.cells.count, 22)
//        XCTAssertEqual(app.cells.firstMatch.images.count, 1)
    }
}
