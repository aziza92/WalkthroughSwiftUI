//
//  WalkthroughView.swift
//  Animation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI

struct WalkthroughView: View {
    
    @State private var currentPage = 0
    @State private var isNavigationActive = false
    
    //
    var pages = [
        WalkthroughPage(img:"bg2", title: "Getting Started", description: "Begin your journey with our comprehensive guide. Learn the basics and get acquainted with the essential features to make the most out of our platform. Whether you're new or just need a refresher, this section will help you get up to speed quickly."),
        WalkthroughPage(img:"bg", title: "Advanced Tips and Tricks", description: "Take your skills to the next level with our advanced tips and tricks. Discover hidden features, shortcuts, and best practices that can help you work more efficiently and effectively. Perfect for those looking to deepen their knowledge and expertise."),
        WalkthroughPage(img:"bg1", title: "Troubleshooting and Support" , description:"Encounter a problem? Find solutions to common issues and learn how to troubleshoot effectively with our detailed guides. This section provides step-by-step instructions and support resources to help you resolve any technical difficulties you might face.")
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count, id: \.self) { index in
                    pages[index]
                        .tag(index)
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            HStack {
                Button(action: {
                    if currentPage > 0 {
                        currentPage -= 1
                    }else {
                        isNavigationActive = true
                    }
                    
                }) {
                    Text("Back")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                }
                .cornerRadius(10)
                .padding()
                
                Button(action: {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    } else {
                        // Navigate to the main app content
                        isNavigationActive = true
                    }
                }) {
                    Text(currentPage < pages.count - 1 ? "Next" : "Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                    
                }
                
                .cornerRadius(10)
                .padding()
            }
        }
        
        .background( LinearGradient(colors: [
            .white, .gray.opacity(0.3)]
                                    ,startPoint: .top, endPoint: .bottom)
        )
        .navigationBarHidden(true)
    }
}

struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
        
    }
}
