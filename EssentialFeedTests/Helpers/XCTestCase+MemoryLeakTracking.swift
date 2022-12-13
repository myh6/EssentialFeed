//
//  XCTestCase+MemoryLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/5.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString, line: UInt) {
        // Run after each test finishes
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have ben deallocate. Potential memory leak.", file: file, line: line)
        }
    }
}
