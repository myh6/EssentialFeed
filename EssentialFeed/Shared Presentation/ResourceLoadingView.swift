//
//  ResourceLoadingView.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/2/1.
//

import Foundation

public protocol ResourceLoadingView: AnyObject {
    func display(_ viewModel: ResourceLoadingViewModel)
}
