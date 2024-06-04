//
//  ContentView.swift
//  Animation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    var body: some View {
        NavigationView {
            WalkthroughView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WalkthroughState())      
    }
}


