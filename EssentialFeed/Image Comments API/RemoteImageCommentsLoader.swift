//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/30.
//

import Foundation

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
