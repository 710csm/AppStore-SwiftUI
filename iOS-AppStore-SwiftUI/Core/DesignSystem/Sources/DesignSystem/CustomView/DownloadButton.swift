//
//  DownloadButton.swift
//
//
//  Created by 최승명 on 7/26/24.
//

import SwiftUI

public struct DownloadButton: View {
    let action: () -> Void
    
    public init(action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(AppText.download)
                .foregroundColor(.blue)
                .fontWeight(.bold)
                .frame(width: 80, height: 32)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(16)
        }
    }
}
