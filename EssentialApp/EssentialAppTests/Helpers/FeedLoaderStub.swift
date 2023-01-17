//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
