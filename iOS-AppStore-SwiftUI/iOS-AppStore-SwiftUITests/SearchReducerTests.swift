//
//  SearchReducerTests.swift
//  iOS-AppStore-SwiftUITests
//
//  Created by 최승명 on 8/6/24.
//

import SwiftData
import SwiftUI
import XCTest

import ComposableArchitecture
import SearchKit

@testable import iOS_AppStore_SwiftUI

final class StoreViewModelTests: XCTestCase {

    // MARK: - Properties
    
    private var repository: RecentSearchRepositoryProtocol!
    private var fetchRecentSearchUseCase: FetchRecentSearchUseCaseProtocol!
    private var saveUseCase: SaveRecentSearchUseCaseProtocol!

    // MARK: - Test Setting
    
    override func setUpWithError() throws {
        self.repository = RecentSearchMockRepository()
        self.fetchRecentSearchUseCase = FetchRecentSearchUseCase(recentSearchRepository: repository)
        self.saveUseCase = SaveRecentSearchUseCase(recentSearchRepository: repository)
    }

    override func tearDownWithError() throws {
        self.repository = nil
        self.fetchRecentSearchUseCase = nil
        self.saveUseCase = nil
    }
    
    // MARK: - Test
    
    @MainActor
    func test_recentSearchList_isEmpty_notReceiveAfterFetch() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.fetchRecentSearch)
        
        // then
        XCTAssertTrue(store.state.histories.isEmpty)
    }
    
    @MainActor
    func test_recentSearchList_isNotEmpty_receiveAfterFetch() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.fetchRecentSearch)
        await store.receive(\.recentSearchResponse)
        
        // then
        XCTAssertTrue(!store.state.histories.isEmpty)
    }
    
    @MainActor
    func test_suggentionList_isChanged_afterKeyboardTapped() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.fetchRecentSearch)
        await store.send(.searchKeywordChange("test"))
        
        // then
        XCTAssertTrue(!store.state.suggestions.isEmpty)
    }
    
    @MainActor
    func test_searchText_isChanged_afterKeyboardTapped() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.searchKeywordChange("test"))
        
        // then
        XCTAssertEqual(store.state.searchText, "test")
    }
    
    @MainActor
    func test_searchState_isChanged_afterKeyboardTapped() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.searchKeywordChange("test"))
        
        // then
        XCTAssertEqual(store.state.showingState, .searching)
    }
    
    @MainActor
    func test_recentSearchResponse_isChanged_afterSearchButtonTapped() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.searchKeywordChange("test"))
        await store.send(.searchButtonTapped)
        await store.receive(\.recentSearchResponse)
        
        // then
        XCTAssertEqual(store.state.histories.count, 3)
    }
    
    @MainActor
    func test_searchState_isChanged_afterSearchButtonTapped() async {
        // given
        let store = TestStore(initialState: SearchReducer.State()) {
            SearchReducer(
                recentSearchUseCase: fetchRecentSearchUseCase,
                saveRecentSearchUseCase: saveUseCase
            )
        }
        store.exhaustivity = .off

        // when
        await store.send(.searchKeywordChange("test"))
        await store.send(.searchButtonTapped)
        await store.receive(\.recentSearchResponse)
        
        // then
        XCTAssertEqual(store.state.showingState, .showingResult)
    }
}
