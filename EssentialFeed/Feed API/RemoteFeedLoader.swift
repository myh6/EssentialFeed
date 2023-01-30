//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/1.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
