//
//  FeedImageLoaderSpy.swift
//  EssentialAppTests
//
//  Created by Min-Yang Huang on 2023/1/17.
//

import EssentialFeed

class FeedImageLoaderSpy: FeedImageDataLoader {
    private var messages = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
    
    var loadedURLs: [URL] {
        return messages.map { $0.url }
    }
    
    private(set) var cancelledURLs = [URL]()
    
    private struct Task: FeedImageDataLoaderTask {
        let callback: () -> Void
        func cancel() { callback() }
    }
    
    public func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
        messages.append((url, completion))
        return Task { [weak self] in
            self?.cancelledURLs.append(url)
        }
    }
    
    public func complete(with error: Error, at index: Int = 0) {
        messages[index].completion(.failure(error))
    }
    
    public func complete(with data: Data, at index: Int = 0) {
        messages[index].completion(.success(data))
    }
}
