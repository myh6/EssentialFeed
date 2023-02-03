//
//  CommentsUIComposer.swift
//  EssentialApp
//
//  Created by Min-Yang Huang on 2023/2/3.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public class CommentsUIComposer {
    private init() {}
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>
    
    public static func commentsComposedWith(
        commentsLoader: @escaping () -> AnyPublisher<[FeedImage], Error>) -> ListViewController {
        let presentationAdapter = FeedPresentationAdapter(loader: { commentsLoader().dispatchOnMainQueue()} )
        
        let feedController = makeFeedViewController(title: FeedPresenter.title)
            feedController.onRefresh = presentationAdapter.loadResource
            
        let presenter = LoadResourcePresenter(
            resourceView: FeedViewAdapter(
                controller: feedController,
                imageLoader: { _ in Empty<Data, Error>().eraseToAnyPublisher() }),
            loadingView: WeakRefVirtualProxy(object: feedController),
            errorView: WeakRefVirtualProxy(object: feedController),
            mapper: FeedPresenter.map)
        presentationAdapter.presenter = presenter
        return feedController
    }
    
    private static func makeFeedViewController(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.title = title
        return feedController
    }
}
