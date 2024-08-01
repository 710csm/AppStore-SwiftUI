//
//  FetchRecentSearchUseCase.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

protocol FetchRecentSearchUseCaseProtocol {
    func execute() async -> RecentSearchResponse
}

struct FetchRecentSearchUseCase: FetchRecentSearchUseCaseProtocol {

    private let recentSearchRepository: RecentSearchRepositoryProtocol

    init(recentSearchRepository: RecentSearchRepositoryProtocol) {
        self.recentSearchRepository = recentSearchRepository
    }

    func execute() async -> RecentSearchResponse {
        return await recentSearchRepository.fetchRecentSearchList()
    }
}
