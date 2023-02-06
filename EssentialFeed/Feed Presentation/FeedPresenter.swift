//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/5.
//
import Foundation

public final class FeedPresenter {
    public static var title: String {
        NSLocalizedString("FEED_VIEW_TITLE",
                          tableName: "Feed",
                          bundle: Bundle(for: FeedPresenter.self),
                          comment: "Title for the feed view")
    }
}
