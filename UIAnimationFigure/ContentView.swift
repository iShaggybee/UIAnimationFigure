//
//  ContentView.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 31.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var animationState = AnimationState()
    
    var body: some View {
        VStack {
            if animationState.isRunning {
                AnimationBlock()
                    .environmentObject(animationState)
            }
            
            Button {
                withAnimation(.easeIn) {
                    animationState.isRunning.toggle()
                }
            } label: {
                Text(animationState.isRunning ? "Stop animation" : "Start animation")
            }
            .padding(.bottom, 20.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
