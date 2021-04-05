//
//  Best_LifterApp.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/04.
//

import SwiftUI

@main
struct Best_LifterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
