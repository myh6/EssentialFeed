//
//  URLSessionHTTPClientTests.swift
//  EssentialFeedTests
//
//  Created by Min-Yang Huang on 2022/12/2.
//

import XCTest

class URLSessionHTTPClient {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    func get(from url: URL) {
        
    }
}
class URLSessionHTTPClientTests: XCTestCase {
    
    func test() {
        let url = URL(string: "http://any-url.com")!
        let session = URLSessionSpy()
        let sut = URLSessionHTTPClient(session: session)

        sut.get(from: url)

        XCTAssertEqual(session.receivedURLs, [url])
    }
    
    private class URLSessionSpy: URLSession {
        var receivedURLs = [URL]()
        
        // Must call a designated initializer of the superclass 'URLSession'
//        override init() {
//            super.init(configuration: .default)
//        }
        
        // Initializer does not override a designated initializer from its superclass
//        override init(configuration: URLSessionConfiguration, delegate: URLSessionDelegate?, delegateQueue queue: OperationQueue?) {
//            super.init(configuration: .default)
//        }
        
        override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            receivedURLs.append(url)
            return FakeURLSessionDataTask()
        }
    }
    
    private class FakeURLSessionDataTask: URLSessionDataTask {
        
    }
}
