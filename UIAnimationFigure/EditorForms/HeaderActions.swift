//
//  HeaderActions.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct HeaderActions: View {
    @EnvironmentObject var animationState: AnimationState
    
    let height: CGFloat
    
    var body: some View {
        HStack {
            Circle()
                .fill(.red)
                .frame(width: 10, height: 10)
                .scaleEffect(animationState.isRunning ? 1 : 1.4)
                .animation(
                    .easeIn.delay(0.5),
                    value: animationState.isRunning
                )
            
            Circle()
                .fill(.yellow)
                .frame(width: 10, height: 10)
            
            Circle()
                .fill(.green)
                .frame(width: 10, height: 10)
            
            Image(systemName: "sidebar.left")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .frame(height: height)
        .padding(.horizontal, 10)
    }
}

struct HeaderActions_Previews: PreviewProvider {
    static var previews: some View {
        HeaderActions(height: 25)
    }
}
