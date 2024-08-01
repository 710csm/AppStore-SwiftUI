//
//  Log.swift
//
//
//  Created by 최승명 on 7/26/24.
//

import Foundation

import CocoaLumberjackSwift

public struct Log {
    
    public static func debug(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        let interpolation = fullMessage(message, file: file, function: function, line: line)
        DDLogDebug(DDLogMessageFormat(stringInterpolation: interpolation))
    }
    
    public static func info(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        let interpolation = fullMessage(message, file: file, function: function, line: line)
        DDLogInfo(DDLogMessageFormat(stringInterpolation: interpolation))
    }
    
    public static func warn(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        let interpolation = fullMessage(message, file: file, function: function, line: line)
        DDLogWarn(DDLogMessageFormat(stringInterpolation: interpolation))
    }
    
    public static func error(_ message: String, file: String = #fileID, function: String = #function, line: UInt = #line) {
        let interpolation = fullMessage(message, file: file, function: function, line: line)
        DDLogError(DDLogMessageFormat(stringInterpolation: interpolation))
    }
    
    private static func fullMessage(_ message: String, file: String, function: String, line: UInt) -> DDLogMessageFormat.StringInterpolation {
        var interpolation = DDLogMessageFormat.StringInterpolation(literalCapacity: message.count+1, interpolationCount: 1)
        interpolation.appendInterpolation("[\(file)(\(line)).\(function)]")
        interpolation.appendLiteral(" " + message)
        return interpolation
    }
}

// MARK: - Make Environment
extension Log {
    public static func setupLoggerConfiguration() {
#if DEBUG
        dynamicLogLevel = .all
#else
        dynamicLogLevel = .error
#endif
        let osLogger = DDOSLogger.sharedInstance
        osLogger.logFormatter = DDLogFileFormatterDefault()
        DDLog.add(osLogger)
    }
}

