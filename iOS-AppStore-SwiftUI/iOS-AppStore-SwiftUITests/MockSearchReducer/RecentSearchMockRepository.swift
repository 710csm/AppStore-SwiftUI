//
//  RecentSearchMockRepository.swift
//  iOS-AppStore-SwiftUITests
//
//  Created by 최승명 on 8/6/24.
//

import Foundation

import SearchKit

public final class RecentSearchMockRepository: RecentSearchRepositoryProtocol {
    
    private var dataList: [RecentSearch] = [
        RecentSearch(keyword: "test1", timeStamp: Date()),
        RecentSearch(keyword: "test2", timeStamp: Date()),
    ]
    
    public init() { }

    public func fetchRecentSearchList() async -> RecentSearchResponse {
        return RecentSearchResponse(results: dataList)
    }
    
    public func saveRecentSearchKeyword(keyword: String) {
        dataList.append(RecentSearch(keyword: keyword, timeStamp: Date()))
    }
}
