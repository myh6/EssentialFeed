//
//  FeedLoadingView.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/5.
//

public protocol FeedLoadingView: AnyObject {
    func display(_ viewModel: FeedLoadingViewModel)
}

