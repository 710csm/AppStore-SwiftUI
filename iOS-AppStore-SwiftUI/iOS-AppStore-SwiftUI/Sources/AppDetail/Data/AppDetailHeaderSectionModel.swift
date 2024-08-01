//
//  AppDetailHeaderSectionModel.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import Foundation

struct AppDetailHeaderSectionModel {
    let artworkUrl100: URL?
    let trackName: String
    let artistName: String
    let id: Int
    let trackViewUrl: String?
    
    init(from result: SearchResult) {
        self.artworkUrl100 = result.artworkUrl100
        self.trackName = result.trackName
        self.artistName = result.artistName
        self.id = result.trackId
        self.trackViewUrl = result.trackViewUrl
    }
}
