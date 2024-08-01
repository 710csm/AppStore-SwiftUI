//
//  AppDetailScreenShotSection.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

import DesignSystem
import NukeUI

struct AppDetailScreenShotSection: View {
    let screenshots: ScreenShots
    
    @State private var index = 0
    
    private var isLongWidth: Bool {
        screenshots.mode == .longWidth
    }
    private var carouselWidth: CGFloat {
        isLongWidth ? UIScreen.main.bounds.width * 0.9 : UIScreen.main.bounds.width * 0.6
    }
    private var carouselHeight: CGFloat {
        carouselWidth / screenshots.mode.ratio
    }
    private var carouselTrailingSpace: CGFloat {
        isLongWidth ? 40 : 140
    }
    
    var body: some View {
        VStack {
            Text(AppText.preview)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            Carousel(
                items: screenshots.urls,
                index: $index,
                spacing: 10,
                trailingSpace: carouselTrailingSpace
            ) {
                LazyImage(url: $0) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                    }
                }
                .frame(width: carouselWidth, height: carouselHeight)
            }
            .frame(height: carouselHeight)
            .padding(.bottom)
        }
    }
}
