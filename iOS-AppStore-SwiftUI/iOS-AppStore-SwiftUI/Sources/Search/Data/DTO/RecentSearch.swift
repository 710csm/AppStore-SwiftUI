//
//  RecentSearch.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import Foundation
import SwiftData

struct RecentSearchResponse {
    let results: [RecentSearch]
}

@Model
final class RecentSearch: Identifiable {
    @Attribute(.unique) var keyword: String
    var timeStamp: Date
    
    init(keyword: String, timeStamp: Date) {
        self.keyword = keyword
        self.timeStamp = timeStamp
    }
}
