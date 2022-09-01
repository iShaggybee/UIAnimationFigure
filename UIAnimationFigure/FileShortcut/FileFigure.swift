//
//  FileFigure.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 31.08.2022.
//

import SwiftUI

struct FileFigure: View {
    let midWidth: CGFloat
    let sizeByX: CGFloat
    let sizeByY: CGFloat
    
    var body: some View {
        let triangleSize = sizeByX * 0.4
        let midSizeByX = sizeByX / 2
        let arcRadius: CGFloat = 4
        
        Path { path in
            path.move(to: CGPoint(x: midWidth + midSizeByX - triangleSize, y: 0))
            path.addLine(to: CGPoint(x: midWidth + midSizeByX, y: triangleSize))
            
            path.addArc(
                tangent1End: CGPoint(x: midWidth + midSizeByX, y: sizeByY),
                tangent2End: CGPoint(x: midWidth - midSizeByX, y: sizeByY),
                radius: arcRadius
            )
            
            path.addLine(to: CGPoint(x: midWidth + midSizeByX, y: sizeByY))
            
            path.addArc(
                tangent1End: CGPoint(x: midWidth - midSizeByX, y: sizeByY),
                tangent2End: CGPoint(x: midWidth - midSizeByX, y: 0),
                radius: arcRadius
            )
            
            path.addLine(to: CGPoint(x: midWidth - midSizeByX, y: sizeByY))
            
            path.addArc(
                tangent1End: CGPoint(x: midWidth - midSizeByX, y: 0),
                tangent2End: CGPoint(x: midWidth + midSizeByX - triangleSize, y: 0),
                radius: arcRadius
            )
            
            path.addLine(to: CGPoint(x: midWidth - midSizeByX, y: 0))
        }
        .fill(.white)
        .shadow(color: .gray, radius: 3, x: 1, y: 1)
        
        FileFigureTriangle(
            midWidth: midWidth,
            midSizeByX: midSizeByX,
            triangleSize: triangleSize,
            arcRadius: arcRadius
        )
        .shadow(color: .gray, radius: 1, x: -1, y: 0)
    }
}

struct FileFigure_Previews: PreviewProvider {
    static var previews: some View {
        FileFigure(
            midWidth: 50,
            sizeByX: 100,
            sizeByY: 130
        )
    }
}
