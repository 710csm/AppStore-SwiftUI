//
//  RecentSearchRepositoryProtocol.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import Foundation

protocol RecentSearchRepositoryProtocol {
    func fetchRecentSearchList() async -> RecentSearchResponse
    func saveRecentSearchKeyword(keyword: String)
}
