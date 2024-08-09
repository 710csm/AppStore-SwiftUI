//
//  AppDetailReleaseNoteSectionModel.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import Foundation

import Utils

struct AppDetailReleaseNoteSectionModel {
    let version: String
    let releaseNotes: String?
    private let currentReleaseDate: String
    
    var updateDatePassedDayText: String {
        // 2017-04-09T05:56:52Z 형태 _ ISO8601 형식
        guard let date = ISO8601DateFormatter().date(from: currentReleaseDate) else { return "" }
        return date.formatPassedDay()
    }
    
    init(from result: AppDetailDTO) {
        self.version = result.version
        self.releaseNotes = result.releaseNotes
        self.currentReleaseDate = result.currentVersionReleaseDate
    }
}
