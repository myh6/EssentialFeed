//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/27.
//

import Combine
import Foundation
import EssentialFeed
import EssentialFeediOS

final class FeedLoaderPresentationAdapter: FeedViewControllerDelegate {
    private let feedLoader: () -> FeedLoader.Publisher
    private var cancellable: Cancellable?
    var presenter: FeedPresenter?
    
    init(feedLoader: @escaping () -> FeedLoader.Publisher) {
        self.feedLoader = feedLoader
    }
    
    func didRequestFeedRefresh() {
        presenter?.didStartLoadingFeed()
        
        cancellable = feedLoader().sink { [weak self] completion in
            switch completion {
            case .finished: break
            case let .failure(error):
                self?.presenter?.didFinishLoadingFeed(with: error)
            }
        } receiveValue: { [weak self] feed in
            self?.presenter?.didFinishLoadingFeed(with: feed)
        }

//        feedLoader.load { [weak self] result in
//            switch result {
//            case let .success(feed):
//                self?.presenter?.didFinishLoadingFeed(with: feed)
//            case let .failure(error):
//                self?.presenter?.didFinishLoadingFeed(with: error)
//            }
//        }
    }
}
