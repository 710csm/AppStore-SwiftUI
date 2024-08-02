//
//  RemoteSearchDataSource.swift
//
//
//  Created by 최승명 on 3/30/24.
//

import NetworkKit
import Utils

final class RemoteSearchDataSource: BaseRemoteDataSource<SearchAPI>, RemoteSearchDataSourceProtocol {
    func fetchSearchList(keyword: String, countLimit: Int) async -> SearchResponse {
        do {
            return try await request(.fetchSearchList(keyword: keyword, countLimit: countLimit))
                .map(SearchResponse.self)
        } catch {
            Log.error(error.localizedDescription)
            return .init(resultCount: 0, results: [])
        }
    }
}
