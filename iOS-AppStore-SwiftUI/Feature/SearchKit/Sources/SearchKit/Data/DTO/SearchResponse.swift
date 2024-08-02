//
//  SearchResponse.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/26/24.
//

import Foundation

public struct SearchResponse: Decodable {
    let resultCount: Int
    let results: [SearchResultDTO]
}

struct SearchResultDTO: Codable {
    let supportedDevices: [String]
    let screenshotUrls, ipadScreenshotUrls: [URL]
    let isGameCenterEnabled: Bool
    let features: [String]
    let advisories: [String]
    let artworkUrl60: URL?
    let artworkUrl100: URL?
    let artworkUrl512: URL
    let artistViewURL: String
    let kind: String
    let currentVersionReleaseDate: String
    let primaryGenreName: String
    let primaryGenreID: Int
    let languageCodesISO2A: [String]
    let averageUserRatingForCurrentVersion: Double
    let fileSizeBytes: String
    let sellerURL: String?
    let formattedPrice: String
    let userRatingCountForCurrentVersion: Int
    let trackContentRating: String
    let releaseNotes: String
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Int
    let description, bundleID, sellerName: String
    let currency: String
    let releaseDate: String
    let trackID: Int
    let trackName: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let minimumOSVersion: String
    let trackViewURL: String
    let contentAdvisoryRating: String
    let averageUserRating: Double
    let trackCensoredName: String
    let genreIDS: [String]
    let version: String
    let wrapperType: String
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case supportedDevices, screenshotUrls, ipadScreenshotUrls, artworkUrl512, isGameCenterEnabled, features, advisories, artworkUrl60, artworkUrl100
        case artistViewURL = "artistViewUrl"
        case kind, currentVersionReleaseDate, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case languageCodesISO2A, averageUserRatingForCurrentVersion, fileSizeBytes
        case sellerURL = "sellerUrl"
        case formattedPrice, userRatingCountForCurrentVersion, trackContentRating, releaseNotes
        case artistID = "artistId"
        case artistName, genres, price, description
        case bundleID = "bundleId"
        case sellerName, currency, releaseDate
        case trackID = "trackId"
        case trackName, isVppDeviceBasedLicensingEnabled
        case minimumOSVersion = "minimumOsVersion"
        case trackViewURL = "trackViewUrl"
        case contentAdvisoryRating, averageUserRating, trackCensoredName
        case genreIDS = "genreIds"
        case version, wrapperType, userRatingCount
    }
}

extension SearchResultDTO {
    func toDomain() -> SearchResultEntity {
        .init(
            trackId: self.trackID,
            trackName: self.trackName,
            description: self.description,
            screenshotUrls: self.screenshotUrls,
            advisories: self.advisories,
            supportedDevices: self.supportedDevices,
            releaseDate: self.releaseDate,
            releaseNotes: self.releaseNotes,
            currentVersionReleaseDate: self.currentVersionReleaseDate,
            version: self.version,
            artistName: self.artistName,
            genres: self.genres,
            trackViewUrl: self.trackViewURL,
            contentAdvisoryRating: self.contentAdvisoryRating,
            averageUserRating: self.averageUserRating,
            userRatingCount: self.userRatingCount,
            artworkUrl60: self.artworkUrl60,
            artworkUrl100: self.artworkUrl100,
            artworkUrl512: self.artworkUrl512,
            fileSizeBytes: self.fileSizeBytes,
            languageCodesISO2A: self.languageCodesISO2A
        )
    }
}
