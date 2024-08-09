//
//  MockAPI.swift
//
//
//  Created by 최승명 on 8/6/24.
//

import Foundation

import NetworkKit
import Moya
import Utils

public enum MockAPI {
    case fetchMockList
}

extension MockAPI: BaseAPI {
    public var domain: BaseDomain {
        switch self {
        default:
            return .search
        }
    }
    
    public var urlPath: String {
        switch self {
        case .fetchMockList:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .fetchMockList:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.default
            )
        }
    }

    public var errorMap: [Int: NetworkError] {
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
