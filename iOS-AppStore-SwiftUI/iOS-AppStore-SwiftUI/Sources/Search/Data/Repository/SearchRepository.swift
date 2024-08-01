//
//  SearchRepository.swift
//
//
//  Created by 최승명 on 3/30/24.
//

struct SearchRepository: SearchRepositoryProtocol {
    
    private let remoteSearchDataSource: RemoteSearchDataSourceProtocol
    
    init(remoteSearchDataSource: RemoteSearchDataSourceProtocol) {
        self.remoteSearchDataSource = remoteSearchDataSource
    }
    
    func fetchSearchList(keyword: String, countLimit: Int) async -> [SearchResultEntity] {
        await remoteSearchDataSource.fetchSearchList(keyword: keyword, countLimit: countLimit).results.map { $0.toDomain() }
    }
}
