//
//  EditorBody.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct EditorBody: View {
    @State private var type = "var"
    @State private var removeAllSymbol = false
    @State private var isWarningShowing = true
    
    @EnvironmentObject var animationState: AnimationState
    
    let firstMultiplier: Int
    let secondMultiplier: Int
    
    let timer = Timer.publish(
        every: 1,
        on: .main,
        in: .common
    ).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            .fill(.white)
            
            VStack(alignment: .leading, spacing: 5.0) {
                HStack {
                    LineOfCode(lineType: .initial(
                        lineNumber: 1,
                        type: type,
                        initCommand:  "a = \(firstMultiplier)"
                    ))
                    .onReceive(timer, perform: animateTypeSubstitution)
                    
                    Spacer()
                    
                    WarningBlock(variableName: "a")
                        .scaleEffect(isWarningShowing ? 1 : 0)
                        .animation(.linear, value: isWarningShowing)
                }

                LineOfCode(lineType: .initial(
                    lineNumber: 2,
                    type: "let",
                    initCommand: "b = \(secondMultiplier)"
                ))
                
                LineOfCode(lineType: .print(
                    lineNumber: 3,
                    value: "a * b"
                ))
            }
            .padding([.top, .leading, .trailing], 10.0)
        }
    }
}

extension EditorBody {
    func animateTypeSubstitution(_ time: Date) {
        if !type.isEmpty && !removeAllSymbol {
            type.removeLast()
        } else {
            let correctType = "let"
            
            self.removeAllSymbol = true
            
            if type.count != correctType.count {
                type.append(correctType[type.count])
            }
            
            if type.count == correctType.count {
                timer.upstream.connect().cancel()
                
                withAnimation(.linear.delay(1)) {
                    isWarningShowing = false
                    animationState.isRunning.toggle()
                }
            }
        }
    }
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

struct EditorBody_Previews: PreviewProvider {
    static var previews: some View {
        EditorBody(firstMultiplier: 5, secondMultiplier: 4)
            .frame(height: 200)
    }
}
