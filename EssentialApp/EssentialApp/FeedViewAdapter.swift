//
//  FeedViewAdapter.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/27.
//

import UIKit
import EssentialFeed
import EssentialFeediOS

/// [FeedImage] -> Adapt -> [FeedImageCellController]
final class FeedViewAdapter: ResourceView {
    
    private weak var controller: ListViewController?
    private let imageLoader: (URL) -> FeedImageDataLoader.Publisher
    
    init(controller: ListViewController, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.display(viewModel.feed.map { model in
            
            let adapter = LoadResourcePresentationAdapter<Data, WeakRefVirtualProxy<FeedImageCellController>>(loader: { [imageLoader] in
                imageLoader(model.url)
            })
            
            let view = FeedImageCellController(
                viewModel: FeedImagePresenter.map(model),
                delegate: adapter)
            
            adapter.presenter = LoadResourcePresenter(
                resourceView: WeakRefVirtualProxy(object: view),
                loadingView: WeakRefVirtualProxy(object: view),
                errorView: WeakRefVirtualProxy(object: view),
                mapper: { data in
                    guard let image = UIImage(data: data) else {
                        throw InvalidImageData()
                    }
                    return image
                })
            
            return CellController(id: model, view)
        })
    }
}

private struct InvalidImageData: Error {}
