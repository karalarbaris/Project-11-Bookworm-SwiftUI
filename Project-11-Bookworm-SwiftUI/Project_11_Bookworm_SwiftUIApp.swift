//
//  Project_11_Bookworm_SwiftUIApp.swift
//  Project-11-Bookworm-SwiftUI
//
//  Created by Baris Karalar on 30.06.2021.
//

import SwiftUI

@main
struct Project_11_Bookworm_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
