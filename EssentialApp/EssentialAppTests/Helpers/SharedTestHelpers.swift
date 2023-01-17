//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data("any Data".utf8)
}
