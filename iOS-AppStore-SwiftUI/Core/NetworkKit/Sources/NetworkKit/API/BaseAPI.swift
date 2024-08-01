//
//  BaseAPI.swift
//
//
//  Created by 최승명 on 7/26/24.
//

import Foundation

import Moya

public protocol BaseAPI: TargetType {
    var domain: BaseDomain { get }
    var urlPath: String { get }
    var errorMap: [Int: NetworkError] { get }
}

public extension BaseAPI {
    var baseURL: URL {
        URL(string: "https://itunes.apple.com")!
    }
    
    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum BaseDomain: String {
    case search
}

extension BaseDomain {
    var asURLString: String {
        "\(self.asDomainString)"
    }
}

extension BaseDomain {
    var asDomainString: String {
        switch self {
        case .search:
            return "/search"
        }
    }
}
