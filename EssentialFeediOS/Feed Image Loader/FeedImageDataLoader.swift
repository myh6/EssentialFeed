//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/20.
//

import Foundation

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
