//
//  Localized.swift
//  EssentialFeed
//
//  Created by Min-Yang Huang on 2023/1/5.
//

public final class Localized {
    static var bundle: Bundle {
        Bundle(for: Localized.self)
    }
}

extension Localized {
    public enum Feed {
        static var table: String { "Feed" }

        public static var title: String {
            NSLocalizedString(
                "FEED_VIEW_TITLE",
                tableName: table,
                bundle: bundle,
                comment: "Title for the feed view")
        }

        public static var loadError: String {
            NSLocalizedString(
                "GENERIC_CONNECTION_ERROR",
                tableName: table,
                bundle: bundle,
                comment: "Error message displayed when we can't load the image feed from the server")
        }
    }
}
