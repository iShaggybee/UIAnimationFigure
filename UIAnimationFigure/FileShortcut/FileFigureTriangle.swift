//
//  FileFigureTriangle.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 31.08.2022.
//

import SwiftUI

struct FileFigureTriangle: View {
    let midWidth: CGFloat
    let midSizeByX: CGFloat
    let triangleSize: CGFloat
    let arcRadius: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: midWidth + midSizeByX - triangleSize, y: 0))
            
            path.addArc(
                tangent1End: CGPoint(x: midWidth + midSizeByX - triangleSize, y: triangleSize),
                tangent2End: CGPoint(x: midWidth + midSizeByX, y: triangleSize),
                radius: arcRadius
            )
            
            path.addLine(to: CGPoint(x: midWidth + midSizeByX - triangleSize, y: triangleSize))
            path.addLine(to: CGPoint(x: midWidth + midSizeByX, y: triangleSize))
        }
        .fill(.white)
    }
}

struct FileFigureTriangle_Previews: PreviewProvider {
    static var previews: some View {
        FileFigureTriangle(
            midWidth: 50,
            midSizeByX: 50,
            triangleSize: 40,
            arcRadius: 4
        )
    }
}
