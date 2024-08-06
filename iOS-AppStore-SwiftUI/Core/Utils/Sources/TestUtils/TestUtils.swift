//
//  TestUtils.swift
//
//
//  Created by 최승명 on 8/6/24.
//

import Foundation

public final class TestUtils {
    public static func loadJSON(for fileName: String, in bundleClass: AnyClass) -> Data? {
        guard let path = Bundle(for: bundleClass).path(forResource: fileName, ofType: "json") else {
            return nil
        }
        
        do {
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)
            return data
        } catch {
            return nil
        }
    }
    
    public static func loadJSONPath(for fileName: String, in bundleClass: AnyClass) -> String {
        guard let path = Bundle(for: bundleClass).path(forResource: fileName, ofType: "json") else {
            return ""
        }
        
        return path
    }
}
