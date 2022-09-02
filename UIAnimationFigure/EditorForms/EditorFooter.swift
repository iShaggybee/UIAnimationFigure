//
//  EditorFooter.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct EditorFooter: View {
    let value: Int
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: width, y: 0))
                
                path.addArc(
                    tangent1End: CGPoint(x: width, y: height),
                    tangent2End: CGPoint(x: 0, y: height),
                    radius: 10
                )
                
                path.addLine(to: CGPoint(x: width, y: height))
                
                path.addArc(
                    tangent1End: CGPoint(x: 0, y: height),
                    tangent2End: CGPoint(x: 0, y: 0),
                    radius: 10
                )
                
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            .fill(.white)
            
            Text("\(value)")
                .font(.system(.body, design: .monospaced))
                .padding([.top, .leading], 10)
        }
    }
}

struct EditorFooter_Previews: PreviewProvider {
    static var previews: some View {
        EditorFooter(value: 20)
            .frame(height: 40)
    }
}
