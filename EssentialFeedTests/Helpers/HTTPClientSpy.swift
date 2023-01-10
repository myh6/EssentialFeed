//
//  HTTPClientSpy.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2023/1/10.
//

import Foundation
import EssentialFeed

class HTTPClientSpy: HTTPClient {
    /// Store the closure as a property for later invocation in the test.
    /// Help you check:
    /// 1. How many times the 'get' method was invoked (via the array count)
    /// 2. Which params were passed to the 'get' method invocations
    /// 3. Order of invocations (if necessary).
    ///
    private struct Task: HTTPClientTask {
        let callback: () -> Void
        func cancel() { callback() }
    }
    
    private var messages = [(url: URL, completion: (HTTPClient.Result) -> Void)]()
    private(set) var cancelledURLs = [URL]()
    
    var requestedURLs: [URL] {
        return messages.map { $0.url }
    }
    
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
        messages.append((url, completion))
        return Task { [weak self] in
            self?.cancelledURLs.append(url)
        }
    }
    
    func complete(with error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
    }
    
    func complete(withStatusCode code: Int, data: Data, at index: Int = 0) {
        let response = HTTPURLResponse(
            url: requestedURLs[index],
            statusCode: code,
            httpVersion: nil,
            headerFields: nil)!
        messages[index].completion(.success((data, response)))
    }
}
