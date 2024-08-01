//
//  AppDetailDescriptionSection.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

import DesignSystem

struct AppDetailDescriptionSection: View {
    let model: AppDetailDescriptionSectionModel
    
    var body: some View {
        VStack {
            ExpandableTextView(text: model.description)
                .padding(.bottom)
            
            Button(action: {}) {
                developerInfoView
            }
        }
        .padding(.horizontal)
    }
    
    private var developerInfoView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.artistName)
                    .foregroundColor(.accentColor)
                    .font(.callout)
                
                Text(AppText.developer)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .foregroundColor(.gray)
                .font(.title3)
        }
    }
}
