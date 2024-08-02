//
//  SearchResultReducer.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/31/24.
//

import SwiftUI

import ComposableArchitecture

@Reducer
struct SearchResultReducer {
    
    // MARK: - State
    
    @ObservableState
    struct State: Equatable {
        enum SearchState {
            case loading
            case showingResult
            case showingEmpty
        }
        
        var isInitalized: Bool = false
        var showingState: SearchState = .showingResult
        var searchResults: [SearchResultEntity] = []
        var countLimit: Int = searchCountLimitUnit
        var isLimit: Bool {
          countLimit >= searchCountMaxLimit
        }
    }
    
    // MARK: - Action
    
    enum Action {
        case loadMore
        case executeSearch
        case searchResponse([SearchResultEntity])
    }
    
    // MARK: - Properties
    
    @Dependency(\.fetchSearchUseCase) var fetchSearchUseCase
    
    private static let searchCountLimitUnit: Int = 20
    private static let searchCountMaxLimit: Int = 200
    
    private var searchText: String = ""
    
    // MARK: - Init
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    // MARK: - Body
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadMore:
                guard state.countLimit < Self.searchCountMaxLimit else {
                    return .none
                }
                return .run { [keyword = self.searchText, countLimit = state.countLimit] send in
                    await send(.searchResponse(await fetchSearchUseCase.execute(keyword: keyword, countLimit: countLimit)))
                }
            case .executeSearch:
                if state.isInitalized {
                    return .none
                }
                
                
                state.isInitalized = true
                state.showingState = .loading
                state.countLimit = Self.searchCountLimitUnit
                
                return .run { [keyword = self.searchText, countLimit = state.countLimit] send in
                    await send(.searchResponse(await fetchSearchUseCase.execute(keyword: keyword, countLimit: countLimit)))
                }
            case let .searchResponse(response):
                if response.isEmpty {
                    state.searchResults = []
                    state.showingState = .showingEmpty
                } else {
                    state.searchResults = response
                    state.showingState = .showingResult
                    state.countLimit += Self.searchCountLimitUnit
                }
                return .none
            }
        }
    }
}
