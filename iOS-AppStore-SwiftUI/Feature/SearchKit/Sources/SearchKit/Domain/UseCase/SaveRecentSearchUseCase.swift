//
//  SaveRecentSearchUseCase.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

public protocol SaveRecentSearchUseCaseProtocol {
    func saveRecentSearchKeyword(keyword: String)
}

public struct SaveRecentSearchUseCase: SaveRecentSearchUseCaseProtocol {

    private let recentSearchRepository: RecentSearchRepositoryProtocol

    public init(recentSearchRepository: RecentSearchRepositoryProtocol) {
        self.recentSearchRepository = recentSearchRepository
    }

    public func saveRecentSearchKeyword(keyword: String) {
        recentSearchRepository.saveRecentSearchKeyword(keyword: keyword)
    }
}
