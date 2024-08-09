//
//  AppDetailDTO.swift
//
//
//  Created by 최승명 on 8/1/24.
//

import Foundation

import Foundation

public struct AppDetailDTO {
    /// 앱 ID
    let trackId: Int
    /// 앱 이름
    let trackName: String
    /// 앱 상세 설명
    let description: String
    /// 앱 스크린샷 URL들
    let screenshotUrls: [URL]
    
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
    let artworkUrl100: URL?
    
    /// 파일 사이즈 바이트
    let fileSizeBytes: String
    
    /// 지원 언어들의 코드 ("EN", "KO"...)
    let languageCodesISO2A: [String]?
    
    public init(
        trackId: Int,
        trackName: String,
        description: String,
        screenshotUrls: [URL],
        releaseNotes: String?,
        currentVersionReleaseDate: String,
        version: String,
        artistName: String,
        genres: [String],
        trackViewUrl: String?,
        contentAdvisoryRating: String,
        averageUserRating: Double, 
        userRatingCount: Int,
        artworkUrl100: URL?,
        fileSizeBytes: String,
        languageCodesISO2A: [String]?
    ) {
        self.trackId = trackId
        self.trackName = trackName
        self.description = description
        self.screenshotUrls = screenshotUrls
        self.releaseNotes = releaseNotes
        self.currentVersionReleaseDate = currentVersionReleaseDate
        self.version = version
        self.artistName = artistName
        self.genres = genres
        self.trackViewUrl = trackViewUrl
        self.contentAdvisoryRating = contentAdvisoryRating
        self.averageUserRating = averageUserRating
        self.userRatingCount = userRatingCount
        self.artworkUrl100 = artworkUrl100
        self.fileSizeBytes = fileSizeBytes
        self.languageCodesISO2A = languageCodesISO2A
    }
}
