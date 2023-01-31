//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import EssentialFeed

class FeedLoaderStub {
    private let result: Swift.Result<[FeedImage], Error>
    
    init(result: Swift.Result<[FeedImage], Error>) {
        self.result = result
    }
    
    func load(completion: @escaping (Swift.Result<[FeedImage], Error>) -> Void) {
        completion(result)
    }
}
