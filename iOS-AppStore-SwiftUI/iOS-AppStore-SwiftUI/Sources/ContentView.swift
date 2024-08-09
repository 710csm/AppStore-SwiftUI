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
            Text("투데이 탭")
                .tabItem {
                    Image(systemName: "doc.text.image")
                    Text("투데이")
                }
            Text("게임 탭")
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("게임")
                }
            Text("앱 탭")
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("앱")
                }
            Text("아케이드 탭")
                .tabItem {
                    Image(systemName: "arcade.stick")
                    Text("Arcade")
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
                Image(systemName: "magnifyingglass")
                Text("검색")
            }
        }
        .font(.headline)
    }
}
