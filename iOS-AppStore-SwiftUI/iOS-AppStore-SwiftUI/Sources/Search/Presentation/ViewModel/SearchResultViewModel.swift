//
//  SearchResultViewModel.swift
//  iOS-AppStore-SwiftUI
//
//  Created by 최승명 on 8/1/24.
//

import Foundation

import AppDetailKit

struct SearchResultViewModel: Decodable, Hashable {
    /// 앱 ID
    let trackId: Int
    /// 앱 이름
    let trackName: String
    /// 앱 스크린샷 URL들
    let screenshotUrls: [URL]
    
    /// 개발자 이름
    let artistName: String
    /// 앱 장르들
    let genre: String
    
    /// 60x60 로고 URL
    let artworkUrl60: URL?
}

// MARK: - Identifiable

extension SearchResultViewModel: Identifiable {
    var id: Int { trackId }
}
