//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/2/3.
//

import Foundation

public enum FeedEndpoint {
    
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            if #available(macOS 13.0, *) {
                return baseURL.appending(path: "/v1/feed")
            } else {
                // Fallback on earlier versions
                return baseURL.appendingPathComponent("/v1/feed")
            }
        }
    }
}
