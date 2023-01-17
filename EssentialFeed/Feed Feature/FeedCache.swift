//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
