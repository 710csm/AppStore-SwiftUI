//
//  SearchRepositoryProtocol.swift
//
//
//  Created by 최승명 on 3/30/24.
//

protocol SearchRepositoryProtocol {
    func fetchSearchList(keyword: String, countLimit: Int) async -> SearchResponse
}
