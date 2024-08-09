//
//  AppDetailInformationSectionModel.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import Foundation

import Utils

struct AppDetailInformationSectionModel {
    let artistName: String
    let firstGenre: String
    let contentAdvisoryRating: String
    private let fileSizeBytes: String
    
    var fileSizeByteText: String {
        let byte = Double(fileSizeBytes) ?? 0
        return byte.byteUnitText
    }
    
    init(from result: AppDetailDTO) {
        self.artistName = result.artistName
        self.fileSizeBytes = result.fileSizeBytes
        self.firstGenre = result.genres.first ?? ""
        self.contentAdvisoryRating = result.contentAdvisoryRating
    }
}
