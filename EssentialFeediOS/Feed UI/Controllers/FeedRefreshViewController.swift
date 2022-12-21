//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/20.
//

import UIKit

final class FeedRefreshViewController: NSObject {
    private(set) lazy var view = binded(UIRefreshControl())
    
    private let viewModel: FeedViewModel
    
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }
        
    @objc func refresh() {
        viewModel.loadFeed()
    }
    
    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        viewModel.onChange = { [weak self] vm in
            if vm.isLoading {
                self?.view.beginRefreshing()
            } else {
                self?.view.endRefreshing()
            }

        }
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
