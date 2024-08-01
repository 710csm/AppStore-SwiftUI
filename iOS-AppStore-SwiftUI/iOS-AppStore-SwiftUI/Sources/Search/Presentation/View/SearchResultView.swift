//
//  SearchResultView.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/26/24.
//

import SwiftUI

import AppDetailKit
import ComposableArchitecture
import DesignSystem
import NukeUI

struct SearchResultView: View {
    
    // MARK: - Properties
    
    @Bindable var store: StoreOf<SearchResultReducer>
    
    // MARK: - Body
    
    var body: some View {
        showingResult
            .onAppear {
                store.send(.executeSearch)
            }
    }
    
    // MARK: - View
    
    @ViewBuilder
    private var showingResult: some View {
        switch store.showingState {
        case .showingResult:
            List {
                ForEach(store.searchResults) { result in
                    VStack {
                        SearchResultHeaderView(result: result)
                        
                        ScreenShotView(
                            screenShots: .init(from: result.screenshotUrls)
                        )
                    }
                    .overlay(
                        NavigationLink(value: result, label: {})
                            .opacity(0.0)
                    )
                    .listRowSeparator(.hidden)
                }
                
                if !store.searchResults.isEmpty && !store.isLimit {
                    bottomProgressView
                }
            }
            .listStyle(.plain)
            .animation(.easeInOut, value: store.state.searchResults)
        case .loading:
            ProgressView()
                .progressViewStyle(.circular)
                .frame(width: 40, height: 40)
        case .showingEmpty:
            Text(AppText.emptyResult)
        }
    }
    
    private var bottomProgressView: some View {
        HStack {
            Spacer()
            ProgressView()
                .id(UUID()) // 여러번 페이징 후 사라지는 현상 해결
                .progressViewStyle(.circular)
                .onAppear {
                    store.send(.loadMore)
                }
            Spacer()
        }
    }
}

// MARK: - SearchResultHeaderView

struct SearchResultHeaderView: View {
    let result: SearchResultViewModel
    
    var body: some View {
        HStack {
            LazyImage(url: result.artworkUrl60)
                .cornerRadius(8)
                .frame(width: 64, height: 64)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(result.trackName)
                    .font(.body)
                    .lineLimit(1)
                
                Text(result.genre)
                    .font(.caption)
                    .foregroundColor(.gray.opacity(0.6))
            }
            
            Spacer()
            
            DownloadButton()
        }
    }
}

// MARK: - SearchResultScreenShotView

struct ScreenShotView: View {
    let screenShots: ScreenShots
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(screenShots.urls.prefix(3), id: \.self) {
                    ScreenShotImageView(
                        url: $0,
                        width: imageWidth,
                        height: imageHeight
                    )
                }
            }
        }
        .selectionDisabled(false)
        .scrollDisabled(!screenShots.isLongWidth)
        .animation(.bouncy, value: screenShots.urls.count)
    }
    
    private let shortSideSize = UIScreen.main.bounds.width / 3 - 20
    
    private var imageWidth: CGFloat {
        return screenShots.isLongWidth ?
        shortSideSize * screenShots.mode.ratio :
        shortSideSize
    }
    
    private var imageHeight: CGFloat {
        return screenShots.isLongWidth ?
        shortSideSize :
        shortSideSize / screenShots.mode.ratio
    }
}

// MARK: - ResultScreenShotImageView

struct ScreenShotImageView: View {
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .cornerRadius(8)
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: width, height: height)
    }
}
