//
//  FetchSearchUseCase.swift
//
//
//  Created by 최승명 on 3/30/24.
//

import ComposableArchitecture

protocol FetchSearchUseCaseProtocol {
    func execute(keyword: String, countLimit: Int) async -> SearchResponse
}

struct FetchSearchUseCase: FetchSearchUseCaseProtocol {

    private let searchRepository: SearchRepositoryProtocol

    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }

    func execute(keyword: String, countLimit: Int) async -> SearchResponse {
        if !keyword.isEmpty {
            return await searchRepository.fetchSearchList(keyword: keyword, countLimit: countLimit)
        } else {
            return SearchResponse(resultCount: 0, results: [])
        }
    }
}

extension DependencyValues {
    var fetchSearchUseCase: FetchSearchUseCaseProtocol {
        get { self[FetchSearchUseCase.self] }
        set { self[FetchSearchUseCase.self] = newValue as! FetchSearchUseCase }
    }
}

extension FetchSearchUseCase: DependencyKey {
    static var liveValue: FetchSearchUseCase {
        return Self(
            searchRepository: SearchRepository(
                remoteSearchDataSource: RemoteSearchDataSource()
            )
        )
    }
}
