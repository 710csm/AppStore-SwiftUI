//
//  AppDetailHeaderSection.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

import DesignSystem
import NukeUI

struct AppDetailHeaderSection: View {
    let model: AppDetailHeaderSectionModel
    
    var body: some View {
        HStack {
            LazyImage(url: model.artworkUrl100) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .cornerRadius(16)
                }
            }
            .frame(width: 110, height: 110)
            
            VStack {
                VStack(alignment: .leading) {
                    Text(model.trackName)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(model.artistName)
                        .foregroundColor(.gray)
                        .font(.callout)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    DownloadButton()
                    Spacer()
                    ShareButton()
                }
            }
        }
        .padding(.horizontal)
    }
}
