//
//  SearchResultReducerTests.swift
//  iOS-AppStore-SwiftUITests
//
//  Created by 최승명 on 8/7/24.
//

import SwiftData
import SwiftUI
import XCTest

import ComposableArchitecture
import SearchKit

@testable import iOS_AppStore_SwiftUI

final class SearchResultReducerTests: XCTestCase {

    // MARK: - Properties
    
    private var remoteDataSource: RemoteSearchDataSourceProtocol!
    private var repository: SearchRepositoryProtocol!
    private var fetchSearchUseCase: FetchSearchUseCaseProtocol!

    // MARK: - Test Setting
    
    override func setUpWithError() throws {
        self.remoteDataSource = RemoteSearchMockDataSource()
        self.repository = SearchRepository(remoteSearchDataSource: remoteDataSource)
        self.fetchSearchUseCase = FetchSearchUseCase(searchRepository: repository)
    }

    override func tearDownWithError() throws {
        self.repository = nil
        self.fetchSearchUseCase = nil
    }
    
    // MARK: - Test
    
    @MainActor
    func test_searchState_isChanged_afterExecuteSearch() async {
        // given
        let store = TestStore(initialState: SearchResultReducer.State()) {
            SearchResultReducer(
                searchText: "test",
                fetchSearchUseCase: fetchSearchUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.executeSearch)
        
        // then
        XCTAssertEqual(store.state.showingState, .loading)
    }
    
    @MainActor
    func test_searchState_isChanged_afterExecuteSearchAndReceive() async {
        // given
        let store = TestStore(initialState: SearchResultReducer.State()) {
            SearchResultReducer(
                searchText: "test",
                fetchSearchUseCase: fetchSearchUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.executeSearch)
        await store.receive(\.searchResponse)
        
        // then
        XCTAssertEqual(store.state.showingState, .showingResult)
    }
    
    @MainActor
    func test_searchResponse_isNotEmpty_afterExecuteSearchAndReceive() async {
        // given
        let store = TestStore(initialState: SearchResultReducer.State()) {
            SearchResultReducer(
                searchText: "test",
                fetchSearchUseCase: fetchSearchUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.executeSearch)
        await store.receive(\.searchResponse)
        
        // then
        XCTAssertTrue(!store.state.searchResults.isEmpty)
    }
    
    @MainActor
    func test_searchResponse_isNotEmpty_afterPagingAndReceive() async {
        // given
        let store = TestStore(initialState: SearchResultReducer.State()) {
            SearchResultReducer(
                searchText: "test",
                fetchSearchUseCase: fetchSearchUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.loadMore)
        await store.receive(\.searchResponse)
        
        // then
        XCTAssertTrue(!store.state.searchResults.isEmpty)
    }
}
