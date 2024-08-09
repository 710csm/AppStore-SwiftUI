//
//  FetchRecentSearchUseCase.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

public protocol FetchRecentSearchUseCaseProtocol {
    func execute() async -> RecentSearchResponse
}

public struct FetchRecentSearchUseCase: FetchRecentSearchUseCaseProtocol {

    private let recentSearchRepository: RecentSearchRepositoryProtocol

    public init(recentSearchRepository: RecentSearchRepositoryProtocol) {
        self.recentSearchRepository = recentSearchRepository
    }

    public func execute() async -> RecentSearchResponse {
        return await recentSearchRepository.fetchRecentSearchList()
    }
}
