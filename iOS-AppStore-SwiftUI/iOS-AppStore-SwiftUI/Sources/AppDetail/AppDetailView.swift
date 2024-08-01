//
//  AppDetailView.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

struct AppDetailView: View {
    
    let result: SearchResult
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                AppDetailHeaderSection(
                    model: .init(from: result)
                )
                .padding(.bottom)
                horizontalDivider
                
                AppDetailHorizontalInfoSection(
                    model: .init(from: result)
                )
                horizontalDivider
                
                AppDetailReleaseNoteSection(
                    model: .init(from: result)
                )
                horizontalDivider
                
                AppDetailScreenShotSection(
                    screenshots: .init(from: result)
                )
                
                AppDetailDescriptionSection(
                    model: .init(from: result)
                )
                .padding(.bottom)
                horizontalDivider
                
                AppDetailInformationSection(
                    model: .init(from: result)
                )
            }
        }
        .navigationBarTitle("", displayMode: .inline)
    }
    
    private var horizontalDivider: some View {
        Divider().padding(.horizontal)
    }
}
