//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/5.
//

public struct ResourceErrorViewModel {
    public let message: String?
    
    static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
}
