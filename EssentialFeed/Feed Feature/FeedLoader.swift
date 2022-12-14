//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/11/30.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    
    func load(completion: @escaping (Result) -> Void)
}
