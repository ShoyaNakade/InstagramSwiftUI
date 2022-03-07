//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/08.
//

import SwiftUI

@main
struct InstagramSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
