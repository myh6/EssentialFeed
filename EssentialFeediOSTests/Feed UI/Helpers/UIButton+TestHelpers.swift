//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Min-Yang Huang on 2022/12/21.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
