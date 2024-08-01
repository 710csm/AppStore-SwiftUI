//
//  Date+Ext.swift
//
//
//  Created by 최승명 on 7/27/24.
//

import Foundation

extension Date {
    // thread safe 함
    private static let passedDayFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        var calender = Calendar.current
        calender.locale = Locale(identifier: "ko")
        formatter.calendar = calender
        return formatter
    }()
    
    /// Date 형태를 지나간 시간을 기준으로 변환합니다. ex) "7주 전"
    public func formatPassedDay() -> String {
        return Self.passedDayFormatter.string(from: self, to: Date()) ?? ""
    }
}
