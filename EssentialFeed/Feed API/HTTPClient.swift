//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2022/12/1.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    func get(from url: URL, completion: @escaping (Result) -> Void)
}
