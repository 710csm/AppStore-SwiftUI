//
//  iOS_AppStore_SwiftUIApp.swift
//  iOS-AppStore-SwiftUI
//
//  Created by 최승명 on 8/1/24.
//

import SwiftData
import SwiftUI

import SearchKit
import Utils

@main
struct Appstore_SwiftUIApp: App {
    
    init() {
        Log.setupLoggerConfiguration()
    }
    
    var modelContainer: ModelContainer = {
        let schema = Schema([RecentSearch.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
}
