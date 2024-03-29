//
//  ImageCommentsEndpoint.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/2/3.
//

import Foundation

public enum ImageCommentsEndpoint {
    case get(UUID)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            if #available(macOS 13.0, *) {
                return baseURL.appending(path: "/v1/image/\(id)/comments")
            } else {
                // Fallback on earlier versions
                return baseURL.appendingPathComponent("/v1/image/\(id)/comments")
            }
        }
    }
}
