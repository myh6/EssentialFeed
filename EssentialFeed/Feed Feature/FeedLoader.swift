//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/11/30.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
