//
//  SearchResponse.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/26/24.
//

import Foundation

struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [SearchResult]
}
