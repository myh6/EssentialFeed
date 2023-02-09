//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
