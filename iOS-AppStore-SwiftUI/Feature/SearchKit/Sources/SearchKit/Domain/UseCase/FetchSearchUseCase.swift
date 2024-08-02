//
//  FetchSearchUseCase.swift
//
//
//  Created by 최승명 on 3/30/24.
//

import ComposableArchitecture

public protocol FetchSearchUseCaseProtocol {
    func execute(keyword: String, countLimit: Int) async -> [SearchResultEntity]
}

public struct FetchSearchUseCase: FetchSearchUseCaseProtocol {

    private let searchRepository: SearchRepositoryProtocol

    public init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }

    public func execute(keyword: String, countLimit: Int) async -> [SearchResultEntity] {
        if !keyword.isEmpty {
            return await searchRepository.fetchSearchList(keyword: keyword, countLimit: countLimit)
        } else {
            return []
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
    public static var liveValue: FetchSearchUseCase {
        return Self(
            searchRepository: SearchRepository(
                remoteSearchDataSource: RemoteSearchDataSource()
            )
        )
    }
}
