//
//  ExpandableTextView.swift
//
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

/// 3줄로 줄이고, "더보기"를 눌러서 확장하는 기능을 구현한 TextView
public struct ExpandableTextView: View {
    
    @State private var isExpanded = false
    @State private var isTruncated = false
    
    let text: String
    private let lineLimit = 3
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(isExpanded ? nil : lineLimit)
                .checkIsTruncated(
                    text: text,
                    withLineLimit: lineLimit,
                    isTruncated: $isTruncated
                )
            
            if !isExpanded && isTruncated {
                Text(isTruncated ? " \(AppText.more)" : "")
                    .foregroundColor(.accentColor)
                    .background(
                        Color(uiColor: UIColor.systemBackground)
                    )
            }
        }
        .onTapGesture {
            withAnimation {
                isExpanded = true
            }
        }
    }
}

struct TextTruncatedCheckModifier: ViewModifier {
    let text: String
    let lineLimit: Int
    @Binding var isTruncated: Bool
    
    func body(content: Content) -> some View {
        content
            .background(
                Text(text)
                    .lineLimit(lineLimit)
                    .background(
                        GeometryReader { visibleTextGeometry in
                            ZStack {
                                Text(text)
                                    .background(
                                        GeometryReader { fullTextGeometry in
                                            Color.clear.onAppear {
                                                // isTruncated 업데이트
                                                isTruncated = fullTextGeometry.size.height > visibleTextGeometry.size.height
                                            }
                                        }
                                    )
                            }
                            .frame(height: .greatestFiniteMagnitude)
                        }
                    )
                    .hidden()
            )
    }
}
