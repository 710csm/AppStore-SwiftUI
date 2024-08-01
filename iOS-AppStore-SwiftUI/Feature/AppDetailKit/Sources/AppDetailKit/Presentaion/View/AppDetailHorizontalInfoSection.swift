//
//  AppDetailHorizontalInfoSection.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

import DesignSystem

struct AppDetailHorizontalInfoSection: View {
    
    let model: AppDetailHorizontalInfoSectionModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ratingInfoView
                infoDivider
                
                ageInfoView
                infoDivider
                
                categoryInfoView
                infoDivider
                
                developerInfoView
            }
            .frame(height: 100, alignment: .center)
        }
    }
    
    private var infoDivider: some View {
        Divider().padding(.vertical)
    }
    
    private var ratingInfoView: some View {
        InfoView(
            headerText: "\(model.userRatingCountText)\(AppText.userRating)",
            footerText: "\(model.averageUserRatingText)"
        ) {
            StarRatingView(rating: model.averageUserRating)
        }
    }
    
    private var ageInfoView: some View {
        InfoView(
            headerText: AppText.age,
            footerText: AppText.ageSub
        ) {
            Text("\(model.contentAdvisoryRating)")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
    
    private var categoryInfoView: some View {
        InfoView(
            headerText: AppText.category,
            footerText: "\(model.firstGenre)"
        ) {
            Image(systemName: "tray")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
    
    private var developerInfoView: some View {
        InfoView(
            headerText: AppText.developer,
            footerText: "\(model.artistName)"
        ) {
            Image(systemName: "person.crop.square")
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}

struct InfoView<Content: View>: View {
    
    let headerText: String
    let footerText: String
    let content: () -> Content
    
    init(
        headerText: String,
        footerText: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.headerText = headerText
        self.footerText = footerText
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(headerText)
                .font(.caption)
            
            content()
            
            Text(footerText)
                .font(.footnote)
        }
        .frame(minWidth: 60)
        .padding(.horizontal)
        .foregroundColor(.gray)
    }
}
