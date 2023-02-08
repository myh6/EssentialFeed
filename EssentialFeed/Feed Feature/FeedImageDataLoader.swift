//
//  FeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/10.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
