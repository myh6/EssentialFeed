//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Min-Yang Huang on 2022/12/23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
