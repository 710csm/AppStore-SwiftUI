//
//  FetchSearchUseCase+Ext.swift
//  iOS-AppStore-SwiftUITests
//
//  Created by 최승명 on 8/19/24.
//

import SearchKit

extension FetchSearchUseCase {
    public static var testValue: FetchSearchUseCase {
        return Self(
            searchRepository: SearchRepository(
                remoteSearchDataSource: RemoteSearchMockDataSource()
            )
        )
    }
}
