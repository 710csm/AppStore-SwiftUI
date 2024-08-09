//
//  ScreenShots.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/29/24.
//

import Foundation

public struct ScreenShots {
    public let urls: [URL]
    
    public init(urls: [URL]) {
        self.urls = urls
    }
    
    public init(from screenshotUrls: [URL]) {
        self.urls = screenshotUrls
    }
}

// MARK: - 스크린샷 비율 관련 로직

extension ScreenShots {
    public var mode: ScreenShotMode {
        guard let screenShotURL = urls.first else { return .none }
        return ScreenShotMode(screenShotURL: screenShotURL)
    }
    
    public var isLongWidth: Bool {
        mode == .longWidth
    }
}

public enum ScreenShotMode {
    case longHeight
    case longWidth
    case none
    
    init(screenShotURL: URL) {
        let screenShotURLString = screenShotURL.absoluteString
        
        if screenShotURLString.contains("392x696") {
            self = .longHeight
            return
        }
        
        if screenShotURLString.contains("406x228") {
            self = .longWidth
            return
        }
        
        self = .none
    }
    
    public var ratio: CGFloat {
        switch self {
        case .longHeight: return 392.0 / 696.0
        case .longWidth: return 406.0 / 228.0
        case .none: return 1.0
        }
    }
}
