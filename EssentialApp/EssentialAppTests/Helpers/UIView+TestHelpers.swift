//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Min-Yang Huang on 2023/1/25.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
