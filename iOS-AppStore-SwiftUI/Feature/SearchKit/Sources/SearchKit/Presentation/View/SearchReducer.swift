//
//  SearchReducer.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/26/24.
//

import SwiftUI

import ComposableArchitecture

@Reducer
public struct SearchReducer {
    
    // MARK: - State
    
    @ObservableState
    public struct State: Equatable {
        enum SearchState {
            case none
            case searching
            case loading
            case showingResult
        }
        
        var searchText: String = ""
        var showingState: SearchState = .none
        var suggestions: [RecentSearch] = []
        var histories: [RecentSearch] = []
        
        public init() {
            self.searchText = ""
            self.showingState = .none
            self.suggestions = []
            self.histories = []
        }
    }
    
    // MARK: - Action
    
    public enum Action {
        case fetchRecentSearch
        case saveRecentSearch(String)
        case recentSearchResponse(RecentSearchResponse)
        
        case searchKeywordChange(String)
        case searchButtonTapped
    }
    
    // MARK: - Properties
    
    private let recentSearchUseCase: FetchRecentSearchUseCaseProtocol
    private let saveRecentSearchUseCase: SaveRecentSearchUseCaseProtocol
    
    // MARK: - Init
    
    public init(
        recentSearchUseCase: FetchRecentSearchUseCaseProtocol,
        saveRecentSearchUseCase: SaveRecentSearchUseCaseProtocol
    ) {
        self.recentSearchUseCase = recentSearchUseCase
        self.saveRecentSearchUseCase = saveRecentSearchUseCase
    }
    
    // MARK: - Body
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .fetchRecentSearch:
                return .run { send in
                    await send(.recentSearchResponse(await recentSearchUseCase.execute()))
                }
            case let .saveRecentSearch(keyword):
                saveRecentSearchUseCase.saveRecentSearchKeyword(keyword: keyword)
                return .none
            case let .recentSearchResponse(response):
                state.histories = response.results
                return .none
            case let .searchKeywordChange(keyword):
                if keyword.isEmpty {
                    state.searchText = ""
                    state.showingState = .none
                    state.suggestions = []
                } else {
                    state.searchText = keyword
                    state.showingState = .searching
                    state.suggestions = state.histories.lazy.filter {
                        $0.keyword.lowercased().contains(keyword.lowercased())
                    }
                }
                return .none
            case .searchButtonTapped:
                state.showingState = .showingResult
                
                return .run { [keyword = state.searchText] send in
                    await send(.saveRecentSearch(keyword))
                    await send(.fetchRecentSearch)
                }
            }
        }
    }
}
