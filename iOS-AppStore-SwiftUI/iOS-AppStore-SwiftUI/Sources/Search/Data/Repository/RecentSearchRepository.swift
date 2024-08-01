//
//  RecentSearchRepository.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftData
import SwiftUI

import Utils

struct RecentSearchRepository: RecentSearchRepositoryProtocol {
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchRecentSearchList() async -> RecentSearchResponse {
        do {
            let sort = [SortDescriptor<RecentSearch>(\.timeStamp, order: .reverse)]
            let desciptor = FetchDescriptor<RecentSearch>(sortBy: sort)
            let response = try modelContext.fetch(desciptor)
            return .init(results: response)
        } catch {
            Log.error(error.localizedDescription)
            return .init(results: [])
        }
    }
    
    func saveRecentSearchKeyword(keyword: String) {
        let recentSearch = RecentSearch(keyword: keyword, timeStamp: Date())
        modelContext.insert(recentSearch)
    }
}
