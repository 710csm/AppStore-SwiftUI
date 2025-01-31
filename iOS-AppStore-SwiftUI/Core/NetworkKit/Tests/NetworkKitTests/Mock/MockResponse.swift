//
//  MockResponse.swift
//  
//
//  Created by 최승명 on 8/6/24.
//

import Foundation

public struct MockResponse: Codable {
    let resultCount: Int?
    let results: [MockDTO]?
}

public struct MockDTO: Codable, Hashable {
    /// 스크린샷
    let screenshotUrls: [String]?
    /// 사이즈별 아트워크
    let artworkUrl60, artworkUrl100, artworkUrl512: String?
    /// 개발 앱 리스트 url
    let artistViewURL: String?
    /// 지원 기기 종류
    let supportedDevices: [String]?
    /// 검색어 종류
    let kind: String?
    /// 앱 이용 가능 연령
    let contentAdvisoryRating: String?
    /// 개발자 이름
    let sellerName: String?
    /// 릴리즈 노트
    let releaseNotes: String?
    /// 앱 상세 뷰 url
    let trackViewURL: String?
    /// 개발자 ID
    let artistID: Int?
    /// 개발자명
    let artistName: String?
    /// 장르
    let genres: [String]?
    /// 가격
    let price: Int?
    /// 앱 설명
    let description: String?
    /// 앱 ID
    let trackID: Int?
    /// 앱 이름
    let trackName: String?
    /// 앱 순위
    let trackContentRating: String?
    /// 장르 ID 배열
    let genreIDS: [String]?
    /// 번들 ID
    let bundleID: String?
    /// 앱 최소 지원 버전
    let minimumOSVersion: String?
    /// 언어 지원 코드
    let languageCodesISO2A: [String]?
    /// 앱 사이즈
    let fileSizeBytes: String?
    /// 개발자 홈페이지 주소
    let sellerURL: String?
    let formattedPrice: String?
    /// 평균 사용자 점수
    let averageUserRating: Double?
    /// 앱 버전
    let version: String?
    /// 사용자 리뷰 수
    let userRatingCount: Int?
}
