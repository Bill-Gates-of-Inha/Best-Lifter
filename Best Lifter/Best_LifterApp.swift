//
//  Best_LifterApp.swift
//  Best Lifter
//
//  Created by νΌμμ on 2021/04/04.
//

import SwiftUI

@main
struct Best_LifterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            Main().environment(\.managedObjectContext, persistenceController.container.viewContext)
//            OnWorkOut().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
