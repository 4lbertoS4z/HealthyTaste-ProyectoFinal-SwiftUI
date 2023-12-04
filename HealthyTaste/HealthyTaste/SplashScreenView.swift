//
//  SplashScreenView.swift
//  HealthyTaste
//
//  Created by alberto saz on 4/12/23.
//

import SwiftUI

struct SplashScreenView: View {
    var coordinator = Coordinator()
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView().environmentObject(coordinator)
        } else {
            VStack {
                VStack {
                    Image("Splash")
                        .resizable()
                        .frame(width: 250, height: 250)
                    Text("Healthy Taste")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(Color.primary)
                    Text("La Revolución del Sabor.")
                        .font(.title)
                        .foregroundColor(Color.primary)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

