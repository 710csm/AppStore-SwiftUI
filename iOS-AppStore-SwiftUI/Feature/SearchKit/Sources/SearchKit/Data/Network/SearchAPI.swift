//
//  SearchAPI.swift
//
//
//  Created by 최승명 on 3/30/24.
//

import NetworkKit
import Moya

public enum SearchAPI {
    case fetchSearchList(keyword: String, countLimit: Int)
}

extension SearchAPI: BaseAPI {
    var domain: BaseDomain {
        switch self {
        default:
            return .search
        }
    }
    
    var urlPath: String {
        switch self {
        case .fetchSearchList:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .fetchSearchList(keyword, countLimit):
            return .requestParameters(
                parameters: [
                    "term": keyword,
                    "country": "KR",
                    "media": "software",
                    "limit": "\(countLimit)"
                ],
                encoding: URLEncoding.default
            )
        }
    }

    var errorMap: [Int: NetworkError] {
        switch self {
        default:
            return [
                400: .badRequest,
                401: .tokenExpired,
                404: .notFound,
                429: .tooManyRequest,
                500: .internalServerError
            ]
        }
    }
}
