//
//  FeedImageDataCache.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import Foundation

public protocol FeedImageDataCache {
    func save(_ data: Data, for url: URL) throws
}
