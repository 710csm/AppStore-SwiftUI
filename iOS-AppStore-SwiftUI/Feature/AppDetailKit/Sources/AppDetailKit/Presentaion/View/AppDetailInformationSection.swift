//
//  AppDetailInformationSection.swift
//  Appstore-SwiftUI
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

import DesignSystem

struct AppDetailInformationSection: View {
    let model: AppDetailInformationSectionModel
    
    var body: some View {
        VStack {
            Text(AppText.infomation)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(DetailInformation.allCases, id: \.self) { information in
                DetailInformationRow(information: information, model: model)
                
                if information != DetailInformation.allCases.last {
                    Divider()
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - InformationRow

struct DetailInformationRow: View {
    let information: DetailInformation
    let model: AppDetailInformationSectionModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text(information.title)
                .font(.callout)
                .foregroundColor(.gray)
            Spacer()
            Text(information.value(from: model))
                .font(.body)
        }
    }
}

// MARK: - DetailInformation

enum DetailInformation: CaseIterable {
    case developer
    case size
    case category
    case regulation
    
    var title: String {
        switch self {
        case .developer: return AppText.provider
        case .size: return AppText.size
        case .category: return AppText.category
        case .regulation: return AppText.contentAdvisoryRating
        }
    }
    
    func value(from model: AppDetailInformationSectionModel) -> String {
        switch self {
        case .developer: return model.artistName
        case .size: return model.fileSizeByteText
        case .category: return model.firstGenre
        case .regulation: return model.contentAdvisoryRating
        }
    }
}
