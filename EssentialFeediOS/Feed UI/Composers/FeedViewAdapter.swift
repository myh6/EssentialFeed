//
//  FeedViewAdapter.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/27.
//

import UIKit
import EssentialFeed

/// [FeedImage] -> Adapt -> [FeedImageCellController]
final class FeedViewAdapter: FeedView {
    
    private weak var controller: FeedViewController?
    private let imageLoader: FeedImageDataLoader
    
    init(controller: FeedViewController, imageLoader: FeedImageDataLoader) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.tableModel = viewModel.feed.map { model in
            let adapter = FeedImageDataLoaderPresentationAdapter<WeakRefVirtualProxy<FeedImageCellController>, UIImage>(model: model, imageLoader: imageLoader)
            let view = FeedImageCellController(delegate: adapter)
            
            adapter.presenter = FeedImagePresenter(view: WeakRefVirtualProxy(object: view), imageTransformer: UIImage.init)
            return view
        }
    }
}
