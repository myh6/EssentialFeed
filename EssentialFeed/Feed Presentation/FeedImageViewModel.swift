//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/6.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        return location != nil
    }
}
