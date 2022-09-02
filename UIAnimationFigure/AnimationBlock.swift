//
//  AnimationBlock.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct AnimationBlock: View {
    @State private var isShortcutShowing = true
    @State private var isEditorShowing = false
    @State private var isAnimationRunning = false
    
    let timer = Timer.publish(
        every: 0.7,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        Spacer()
        
        ZStack {
            if isShortcutShowing {
                FileShortcut()
                    .onReceive(timer) { _ in
                        if isAnimationRunning {
                            timer.upstream.connect().cancel()
                            isShortcutShowing.toggle()
                            
                            withAnimation(.linear) {
                                isEditorShowing.toggle()
                            }
                        } else {
                            isAnimationRunning.toggle()
                        }
                    }
                    .scaleEffect(isAnimationRunning ? 1.3 : 1)
                    .animation(.easeIn.repeatCount(2), value: isAnimationRunning)
            } else
            
            if isEditorShowing {
                EditorForm()
                    .padding()
                    .transition(.scale)
            }
        }
        
        Spacer()
    }
}

struct AnimationBlock_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBlock()
    }
}
