//
//  RemoteSearchDataSourceProtocol.swift
//
//
//  Created by 최승명 on 3/30/24.
//

import NetworkKit

public public protocol RemoteSearchDataSourceProtocol {
    func fetchSearchList(keyword: String, countLimit: Int) async -> SearchResponse
}
