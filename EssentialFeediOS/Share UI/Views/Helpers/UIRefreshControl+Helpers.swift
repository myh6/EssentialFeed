//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2023/2/2.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}

