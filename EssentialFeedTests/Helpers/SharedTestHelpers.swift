//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/7.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyData() -> Data {
    return Data("any Data".utf8)
}
