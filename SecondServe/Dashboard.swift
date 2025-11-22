//
//  ContentView.swift
//  SecondServe
//
//  Created by Marc Rodenas Guasch on 21/11/25.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        
        ZStack {
            Color(.gray).ignoresSafeArea()
            
            Image("foodBanana")
                .resizable()
                .cornerRadius(25)
                .aspectRatio(contentMode:.fit)
                .padding()
            Text("Banana")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        
    }
}

#Preview {
    Dashboard()
}
