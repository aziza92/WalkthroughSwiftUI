//
//  WalkthroughState.swift
//  Animation
//
//  Created by KARMANI Aziza on 12/09/2023.
//

import Foundation
import SwiftUI

class WalkthroughState: ObservableObject {
    @Published var isWalkthroughCompleted = false
    
    
    @Published var isWalkthroughKey: Bool = UserDefaults.standard.bool(forKey: "isWalkthroughKey") {
        didSet {
            UserDefaults.standard.set(self.isWalkthroughKey, forKey: "isWalkthroughKey")
        }
    }
}
