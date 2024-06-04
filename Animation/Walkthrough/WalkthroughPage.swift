//
//  WalkthroughPage.swift
//  Animation
//
//  Created by KARMANI Aziza on 11/09/2023.
//

import SwiftUI

struct WalkthroughPage: View {
    var img: String
    let title: String
    let description: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 300)
            

            
            Text(title)
                .fontWeight(.semibold)
                .font(.title)
                .foregroundColor(.black.opacity(0.9))
                .padding(.top)
            
            Text(description)
                .padding(.top, 3)
                .foregroundColor(.black.opacity(0.8))
            Spacer(minLength: 0)
   
        }
     
        .padding()
    }
}

struct WalkthroughPage_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughPage(img:"bg", title: "Bienvenue", description: "Bienvenue sur notre application!")
    }
}
