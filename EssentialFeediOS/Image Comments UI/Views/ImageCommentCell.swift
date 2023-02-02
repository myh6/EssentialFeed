//
//  ImageCommentCell.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2023/2/2.
//

import UIKit


public final class ImageCommentCell: UITableViewCell {
    @IBOutlet private(set) public var messageLabel: UILabel!
    @IBOutlet private(set) public var usernameLabel: UILabel!
    @IBOutlet private(set) public var dateLabel: UILabel!
    
    var onRetry: (() -> Void)?
    
    @IBAction private func retryButtonTapped() {
        onRetry?()
    }
}