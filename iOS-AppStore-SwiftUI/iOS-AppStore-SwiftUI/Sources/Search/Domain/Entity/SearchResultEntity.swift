//
//  SearchResultEntity.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/26/24.
//

import Foundation

import AppDetailKit

struct SearchResultEntity: Decodable, Hashable {
    /// 앱 ID
    let trackId: Int
    /// 앱 이름
    let trackName: String
    /// 앱 상세 설명
    let description: String
    /// 앱 스크린샷 URL들
    let screenshotUrls: [URL]
    /// 주의사항
    let advisories: [String]
    /// 지원되는 기기들
    let supportedDevices: [String]
    
    /// 초기 출시일
    let releaseDate: String
    /// 최근 릴리즈 노트
    let releaseNotes: String?
    /// 최근 업데이트일
    let currentVersionReleaseDate: String
    /// 최신 버전
    let version: String
    
    /// 개발자 이름
    let artistName: String
    /// 앱 장르들
    let genres: [String]
    /// 앱 링크
    let trackViewUrl: String?
    
    /// 사용 연령
    let contentAdvisoryRating: String
    /// 평가 평균 별점
    let averageUserRating: Double
    /// 평가 갯수
    let userRatingCount: Int
    
    /// 60x60 로고 URL
    let artworkUrl60: URL?
    /// 100x100 로고 URL
    let artworkUrl100: URL?
    /// 512x512 로고 URL
    let artworkUrl512: URL
    
    /// 파일 사이즈 바이트
    let fileSizeBytes: String
    
    /// 지원 언어들의 코드 ("EN", "KO"...)
    let languageCodesISO2A: [String]?
}

extension SearchResultEntity {
    func toAppDetail() -> AppDetailDTO {
        .init(
            trackId: self.trackId,
            trackName: self.trackName,
            description: self.description,
            screenshotUrls: self.screenshotUrls,
            releaseNotes: self.releaseNotes,
            currentVersionReleaseDate: self.currentVersionReleaseDate,
            version: self.version,
            artistName: self.artistName,
            genres: self.genres,
            trackViewUrl: self.trackViewUrl,
            contentAdvisoryRating: self.contentAdvisoryRating,
            averageUserRating: self.averageUserRating,
            userRatingCount: self.userRatingCount,
            artworkUrl100: self.artworkUrl100,
            fileSizeBytes: self.fileSizeBytes,
            languageCodesISO2A: self.languageCodesISO2A
        )
    }
}

extension SearchResultEntity {
    func toViewModel() -> SearchResultViewModel {
        .init(
            trackId: self.trackId,
            trackName: self.trackName, 
            screenshotUrls: self.screenshotUrls,
            artistName: self.artistName,
            genre: self.genres.first ?? "",
            artworkUrl60: self.artworkUrl60
        )
    }
}
