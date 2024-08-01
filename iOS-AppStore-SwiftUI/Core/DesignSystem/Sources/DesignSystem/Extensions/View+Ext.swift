//
//  View+Ext.swift
//  
//
//  Created by 최승명 on 7/27/24.
//

import SwiftUI

extension View {
    /// 해당 텍스트가 lineLimit를 기준으로 잘리는지 아닌지를 확인하고 업데이트
    func checkIsTruncated(
        text: String,
        withLineLimit lineLimit: Int,
        isTruncated: Binding<Bool>
    ) -> some View {
        self.modifier(
            TextTruncatedCheckModifier(
                text: text,
                lineLimit: lineLimit,
                isTruncated: isTruncated
            )
        )
    }
    
    public func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
