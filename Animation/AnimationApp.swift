//
//  AnimationApp.swift
//  Animation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI

@main
struct AnimationApp: App {
    let persistenceController = PersistenceController.shared
  
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(WalkthroughState())  
        }
    }
}
