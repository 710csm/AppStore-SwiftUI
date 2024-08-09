//
//  AppDetailReleaseNoteSection.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

import DesignSystem

struct AppDetailReleaseNoteSection: View {
    let model: AppDetailReleaseNoteSectionModel
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text(AppText.newFunction)
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button(AppText.releaseNotes) {}
            }
            
            HStack {
                Text("\(AppText.version) \(model.version)")
                Spacer()
                Text("\(model.updateDatePassedDayText) \(AppText.ago)")
            }
            .foregroundColor(.gray)
            
            if let releaseNotes = model.releaseNotes {
                ExpandableTextView(text: releaseNotes)
            }
        }
        .padding(.horizontal)
    }
}
