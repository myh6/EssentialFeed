//
//  FeedImageCellViewModel.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/21.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool
    
    var hasLocation: Bool {
        return location != nil
    }
}
