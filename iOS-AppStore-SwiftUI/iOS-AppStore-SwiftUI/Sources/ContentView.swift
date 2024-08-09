//
//  ContentView.swift
//  iOS-AppStore-SwiftUI
//
//  Created by 최승명 on 8/1/24.
//

import SwiftUI

import SearchKit
import ComposableArchitecture

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        TabView {
            Text("The First Tab")
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            SearchView(
                store: Store(initialState: SearchReducer.State()) {
                    SearchReducer(
                        recentSearchUseCase: FetchRecentSearchUseCase(
                            recentSearchRepository: RecentSearchRepository(modelContext: modelContext)
                        ),
                        saveRecentSearchUseCase: SaveRecentSearchUseCase(
                            recentSearchRepository: RecentSearchRepository(modelContext: modelContext)
                        )
                    )
                }
            )
            .tabItem {
                Image(systemName: "3.square.fill")
                Text("Third")
            }
        }
        .font(.headline)
    }
}
