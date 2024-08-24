//
//  SearchResultReducer.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/31/24.
//

import SwiftUI

import ComposableArchitecture

@Reducer
public struct SearchResultReducer {
    
    // MARK: - State
    
    @ObservableState
    public struct State: Equatable {
        public enum SearchState {
            case loading
            case showingResult
            case showingEmpty
        }
        
        public var isInitalized: Bool = false
        public var showingState: SearchState = .showingResult
        public var searchResults: [SearchResultEntity] = []
        public var countLimit: Int = searchCountLimitUnit
        public var isLimit: Bool {
          countLimit >= searchCountMaxLimit
        }
        
        public init() {
            self.isInitalized = false
            self.showingState = .showingResult
            self.searchResults = []
            self.countLimit = searchCountLimitUnit
        }
    }
    
    // MARK: - Action
    
    public enum Action {
        case loadMore
        case executeSearch
        case searchResponse([SearchResultEntity])
    }
    
    // MARK: - Properties
    
    private static let searchCountLimitUnit: Int = 20
    private static let searchCountMaxLimit: Int = 200
    
    private let fetchSearchUseCase: FetchSearchUseCaseProtocol
    
    private var searchText: String = ""
    
    // MARK: - Init
    
    public init(searchText: String, fetchSearchUseCase: FetchSearchUseCaseProtocol) {
        self.searchText = searchText
        self.fetchSearchUseCase = fetchSearchUseCase
    }
    
    // MARK: - Body
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadMore:
                guard state.countLimit < Self.searchCountMaxLimit else {
                    return .none
                }
                return .run { [keyword = self.searchText, countLimit = state.countLimit] send in
                    await send(
                        .searchResponse(
                            await fetchSearchUseCase.execute(keyword: keyword, countLimit: countLimit)
                        )
                    )
                }
            case .executeSearch:
                if state.isInitalized {
                    return .none
                }
                
                state.isInitalized = true
                state.showingState = .loading
                state.countLimit = Self.searchCountLimitUnit
                
                return .run { [keyword = self.searchText, countLimit = state.countLimit] send in
                    await send(
                        .searchResponse(
                            await fetchSearchUseCase.execute(keyword: keyword, countLimit: countLimit)
                        )
                    )
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
