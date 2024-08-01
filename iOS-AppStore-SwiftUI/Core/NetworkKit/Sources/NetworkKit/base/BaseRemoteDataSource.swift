//
//  BaseRemoteDataSource.swift
//
//
//  Created by 최승명 on 7/26/24.
//

import Moya
import Utils

open class BaseRemoteDataSource<API: BaseAPI> {
    private let provider: MoyaProvider<API>
    private let maxRetryCount = 2

    public init(
        provider: MoyaProvider<API>? = nil
    ) {
        #if DEBUG
        self.provider = provider ?? MoyaProvider(plugins: [NetworkLoggingPlugin()])
        #else
        self.provider = provider ?? MoyaProvider()
        #endif
    }

    public func request(_ api: API) async throws -> Response {
        let result = await defaultRequest(api)
        switch result {
        case let .success(response):
            return response
        case let .failure(error):
            Log.error(error.localizedDescription)
            throw error
        }
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) async -> Result<Response, MoyaError>  {
        return await provider.request(api)
    }
}

extension MoyaProvider {
    func request(_ target: Target) async -> Result<Response, MoyaError> {
        await withCheckedContinuation { continuation in
            self.request(target) { result in
                continuation.resume(returning: result)
            }
        }
    }
}
