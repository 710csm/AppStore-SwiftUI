//
//  SearchView.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/26/24.
//

import SwiftUI

import AppDetailKit
import ComposableArchitecture
import DesignSystem

struct SearchView: View {
    
    // MARK: - Properties
    
    @Bindable var store: StoreOf<SearchReducer>
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            showingList
                .navigationTitle(AppText.searchBarTitle)
                .navigationDestination(for: SearchResultEntity.self) { searchResult in
                    AppDetailView(result: searchResult.toAppDetail())
                }
        }
        .autocorrectionDisabled()
        .searchable(
            text: $store.searchText.sending(\.searchKeywordChange),
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: AppText.searchBarPlaceHolder
        )
        .searchSuggestions {
            if store.showingState == .searching {
                suggestionView
            }
        }
        .onAppear {
            store.send(.fetchRecentSearch)
        }
        .onSubmit(of: .search) {
            store.send(.searchButtonTapped)
        }
        .animation(.easeInOut, value: store.state.showingState)
    }
    
    // MARK: - View
    
    @ViewBuilder
    private var showingList: some View {
        switch store.showingState {
        case .none, .searching:
            recentSearchView
        case .showingResult:
            SearchResultView(
                store: Store(initialState: SearchResultReducer.State()) {
                    SearchResultReducer(searchText: store.searchText)
                }
            )
        case .loading:
            ProgressView()
                .progressViewStyle(.circular)
                .frame(width: 40, height: 40)
        }
    }
    
    // 최근 검색어
    private var recentSearchView: some View {
        Section {
            List(store.histories, id: \.self) { recentSearch in
                Button {
                    store.send(.searchKeywordChange(recentSearch.keyword))
                    store.send(.searchButtonTapped)
                    hideKeyboard()
                } label: {
                    Text(recentSearch.keyword)
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
            .listStyle(.plain)
        } header: {
            recentSearchTitle
        }
    }
    
    private var recentSearchTitle: some View {
        Text(AppText.recentKeyword)
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top)
    }
    
    // 검색어 일치 화면
    private var suggestionView: some View {
        ForEach(store.suggestions, id: \.keyword) { suggestion in
            HStack(spacing: 5) {
                Image(systemName: "magnifyingglass")
                Text(suggestion.keyword)
            }
            .onTapGesture {
                store.send(.searchKeywordChange(suggestion.keyword))
                store.send(.searchButtonTapped)
                hideKeyboard()
            }
        }
        .listStyle(.plain)
    }
}
