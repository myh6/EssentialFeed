//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Min-Yang Huang on 2022/12/21.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}

