//
//  RemoteFeedImageDataLoader.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/10.
//

import Foundation

public class FeedImageDataMapper {
    
    public enum Error: Swift.Error {
        case invalidData
    }
    
    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.isOK, !data.isEmpty else {
            throw Error.invalidData
        }
        return data
    }
}
