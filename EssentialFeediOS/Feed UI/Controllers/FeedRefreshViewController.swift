//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/20.
//

import UIKit

protocol FeedRefreshViewControllerDelegate {
    func didRequestFeedRefresh()
}

final class FeedRefreshViewController: NSObject, FeedLoadingView {
    @IBOutlet private(set) var view: UIRefreshControl?
    
    var delegate: FeedRefreshViewControllerDelegate?
        
    @IBAction func refresh() {
        delegate?.didRequestFeedRefresh()
    }
    
    func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        } else {
            view?.endRefreshing()
        }
    }
}
