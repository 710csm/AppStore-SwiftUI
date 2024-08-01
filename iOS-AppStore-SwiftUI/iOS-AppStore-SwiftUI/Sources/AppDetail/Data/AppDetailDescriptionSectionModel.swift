//
//  AppDetailDescriptionSectionModel.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import Foundation

struct AppDetailDescriptionSectionModel {
    let description: String
    let artistName: String
    
    init(from result: SearchResult) {
        self.description = result.description
        self.artistName = result.artistName
    }
}
