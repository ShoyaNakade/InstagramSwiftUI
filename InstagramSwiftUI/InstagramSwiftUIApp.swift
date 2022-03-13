//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/08.
//

import SwiftUI
import Firebase


@main
struct InstagramSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel.shared)
//            LoginView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
