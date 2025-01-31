//
//  Carousel.swift
//
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

/// 좌측으로 정렬하고 우측의 컨텐츠를 약간 보여주는 Carousel _ For AppStore
public struct Carousel<Content: View, T: Hashable>: View {
    
    // MARK: - Properties
    
    let content: (T) -> Content
    let items: [T]
    
    let spacing: CGFloat
    let trailingSpace: CGFloat
    
    @Binding var index: Int
    
    @GestureState private var offset: CGFloat = 0
    @State private var currentIndex: Int = 0
    
    // MARK: - Initialization
    
    public init(
        items: [T],
        index: Binding<Int>,
        spacing: CGFloat = 10,
        trailingSpace: CGFloat = 100,
        content: @escaping (T) -> Content
    ) {
        self.items = items
        self._index = index
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self.content = content
    }
    
    // MARK: - Body
    
    public var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - (trailingSpace - spacing)
            
            HStack(spacing: spacing) {
                ForEach(items, id: \.self) { item in
                    content(item)
                        .frame(width: max(geometry.size.width - trailingSpace, 0))
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: (CGFloat(currentIndex) * -width) + offset)
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        // offset을 업데이트
                        out = value.translation.width
                    })
                    .onEnded { value in
                        let offset = value.translation.width
                        
                        // 전체 넓이 대비 드래그한 비율을 계산하고,
                        // 해당 비율을 반올림하여 가까운 Carousel 아이템으로 이동
                        let progress = -offset / width
                        let roundedIndex = progress.rounded()
                        
                        var targetIndex = min(
                            currentIndex + Int(roundedIndex),
                            items.count - 1
                        )
                        targetIndex = max(targetIndex, 0)
                        
                        currentIndex = targetIndex
                    }
            )
        }
        .animation(.easeInOut, value: offset == 0) // 손을 놓았을때 offset이 0이 되니 자연스럽게 애니메이션되어 원래 위치로.
    }
}
