//
//  SaveRecentSearchUseCase.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

protocol SaveRecentSearchUseCaseProtocol {
    func saveRecentSearchKeyword(keyword: String)
}

struct SaveRecentSearchUseCase: SaveRecentSearchUseCaseProtocol {

    private let recentSearchRepository: RecentSearchRepositoryProtocol

    init(recentSearchRepository: RecentSearchRepositoryProtocol) {
        self.recentSearchRepository = recentSearchRepository
    }

    func saveRecentSearchKeyword(keyword: String) {
        recentSearchRepository.saveRecentSearchKeyword(keyword: keyword)
    }
}
