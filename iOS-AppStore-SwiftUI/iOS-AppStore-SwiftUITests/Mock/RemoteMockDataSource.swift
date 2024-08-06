//
//  RemoteMockDataSource.swift
//  iOS-AppStore-SwiftUITests
//
//  Created by 최승명 on 8/6/24.
//

import Foundation

import NetworkKit
import SearchKit
import TestUtils

public final class RemoteMockDataSource: BaseRemoteDataSource<SearchAPI>, RemoteSearchDataSourceProtocol {
    public func fetchSearchList(keyword: String, countLimit: Int) async -> SearchResponse {
        guard let mockResponseJSONData = TestUtils.loadJSON(for: "MockResponseJSON", in: type(of: self)) else {
            return SearchResponse()
        }
        
        do {
            let response = try JSONDecoder().decode(SearchResponse.self, from: mockResponseJSONData)
            return response
        } catch {
            return SearchResponse()
        }
    }
}
