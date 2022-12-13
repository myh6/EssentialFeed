//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/7.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
