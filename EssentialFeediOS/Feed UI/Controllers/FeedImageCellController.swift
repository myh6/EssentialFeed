//
//  FeedImageCellController.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/21.
//

import UIKit
import EssentialFeed

final class FeedImageCellViewModel {
    private var task: FeedImageDataLoaderTask?
    private let model: FeedImage
    private var imageLoader: FeedImageDataLoader
    
    init(model: FeedImage, imageLoader: FeedImageDataLoader) {
        self.model = model
        self.imageLoader = imageLoader
    }
    
    var location: String? {
        return model.location
    }
    
    var description: String? {
        return model.description
    }
    
    var hasLocation: Bool {
        return location != nil
    }
    
    var onImageLoad: ((UIImage) -> Void)?
    var onShouldRetryImageLoadStateChange: ((Bool) -> Void)?
    var onImageLoadingStateChange: ((Bool) -> Void)?
    
    func loadImageData() {
        onImageLoadingStateChange?(true)
        onShouldRetryImageLoadStateChange?(false)
        task = imageLoader.loadImageData(from: self.model.url) { [weak self] result in
            self?.handle(result)
        }
    }
    
    private func handle(_ result: FeedImageDataLoader.Result) {
        if let image = (try? result.get()).flatMap(UIImage.init) {
            onImageLoad?(image)
        } else {
            onShouldRetryImageLoadStateChange?(true)
        }
        onImageLoadingStateChange?(false)
    }
    
    func cancelImageDataLoad() {
        task?.cancel()
        task = nil
    }
    
}

final class FeedImageCellController {
    private let viewModel: FeedImageCellViewModel
    
    init(viewModel: FeedImageCellViewModel) {
        self.viewModel = viewModel
    }
    
    func view() -> UITableViewCell {
        let cell = binded(FeedImageCell())
        viewModel.loadImageData()
        return cell
    }
    
    func preload() {
        viewModel.loadImageData()
    }
    
    func cancelLoad() {
        viewModel.cancelImageDataLoad()
    }
    
    private func binded(_ cell: FeedImageCell) -> FeedImageCell {
        cell.locationContainer.isHidden = !viewModel.hasLocation
        cell.locationLabel.text = viewModel.location
        cell.descriptionLabel.text = viewModel.description
        cell.onRetry = viewModel.loadImageData
        
        viewModel.onImageLoad = { [weak cell] image in
            cell?.feedImageView.image = image
        }
        
        viewModel.onImageLoadingStateChange = { [weak cell] isLoading in
            cell?.feedImageContainer.isShimmering = isLoading
        }
        
        viewModel.onShouldRetryImageLoadStateChange = { [weak cell] shouldRetry in
            cell?.feedImageRetryButton.isHidden = !shouldRetry
        }
        return cell
    }
}
