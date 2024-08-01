//
//  SpinnerView.swift
//
//
//  Created by 최승명 on 7/26/24.
//

import SwiftUI

public struct SpinnerView: View {
    public var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center)
    }
}
