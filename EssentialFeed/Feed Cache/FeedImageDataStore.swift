//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/11.
//

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>
    
    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
