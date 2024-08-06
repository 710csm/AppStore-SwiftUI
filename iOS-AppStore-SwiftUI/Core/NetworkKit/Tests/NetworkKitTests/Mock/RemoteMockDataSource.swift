//
//  RemoteMockDataSource.swift
//
//
//  Created by 최승명 on 8/6/24.
//

import Foundation

import NetworkKit
import Moya

public final class RemoteMockDataSource: BaseRemoteDataSource<MockAPI>, RemoteMockDataSourceProtocol {
    public func fetchMockList() async -> MockResponse {
        let response = MockResponse(
            resultCount: 1,
            results: [
                MockDTO(
                    screenshotUrls: ["screenshotUrl1", "screenshotUrl2", "screenshotUrl3"],
                    artworkUrl60: "artworkUrl60",
                    artworkUrl100: "artworkUrl100",
                    artworkUrl512: "artworkUrl512",
                    artistViewURL: "artistViewURL",
                    supportedDevices: ["supportedDevice1", "supportedDevice2", "supportedDevice3"],
                    kind: "test",
                    contentAdvisoryRating: "test",
                    sellerName: "test name",
                    releaseNotes: "test release note",
                    trackViewURL: "trackViewURL",
                    artistID: 1,
                    artistName: "test name",
                    genres: ["test"],
                    price: 1000,
                    description: "test description",
                    trackID: 1,
                    trackName: "test name",
                    trackContentRating: "test",
                    genreIDS: ["", "", ""],
                    bundleID: "test bundleID",
                    minimumOSVersion: "13",
                    languageCodesISO2A: ["kr"],
                    fileSizeBytes: "10",
                    sellerURL: "seller url",
                    formattedPrice: "1000",
                    averageUserRating: 5,
                    version: "1.0",
                    userRatingCount: 5
                )
            ]
        )
        
        return response
    }
}
