//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/11/30.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadItem(completion: @escaping (LoadFeedResult) -> Void)
}
