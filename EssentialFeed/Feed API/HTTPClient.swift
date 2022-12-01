//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/1.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
