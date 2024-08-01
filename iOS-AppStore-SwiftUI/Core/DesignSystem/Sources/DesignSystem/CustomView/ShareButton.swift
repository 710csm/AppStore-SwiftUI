//
//  ShareButton.swift
//
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

public struct ShareButton: View {
    let action: () -> Void
    
    public init(action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .fontWeight(.medium)
        }
    }
}
