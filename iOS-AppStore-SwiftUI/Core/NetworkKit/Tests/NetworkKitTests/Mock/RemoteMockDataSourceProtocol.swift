//
//  RemoteMockDataSourceProtocol.swift
//
//
//  Created by 최승명 on 8/6/24.
//

import NetworkKit

public protocol RemoteMockDataSourceProtocol {
    func fetchMockList() async -> MockResponse
}
