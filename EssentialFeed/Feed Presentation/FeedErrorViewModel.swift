//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/5.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
