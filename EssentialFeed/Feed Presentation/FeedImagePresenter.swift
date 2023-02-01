//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/6.
//
import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
