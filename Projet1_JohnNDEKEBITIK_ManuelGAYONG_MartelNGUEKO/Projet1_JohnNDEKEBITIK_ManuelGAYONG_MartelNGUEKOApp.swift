//
//  Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKOApp.swift
//  Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKO
//
//  Created by John Marvin NDEKEBITIK HELIANG on 2025-02-10.
//

import SwiftUI
import SwiftData

@main
struct Projet1_JohnNDEKEBITIK_ManuelGAYONG_MartelNGUEKOApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
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
        }
        .modelContainer(sharedModelContainer)
    }
}
