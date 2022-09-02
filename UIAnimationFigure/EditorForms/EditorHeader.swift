//
//  EditorHeader.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct EditorHeader: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addArc(
                    tangent1End: CGPoint(x: width, y: 0),
                    tangent2End: CGPoint(x: width, y: height),
                    radius: 10
                )
                
                path.addLine(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: 0, y: height))
                
                path.addArc(
                    tangent1End: CGPoint(x: 0, y: 0),
                    tangent2End: CGPoint(x: width, y: 0),
                    radius: 10
                )
            }
            .fill(Color(red: 0.975, green: 0.96, blue: 0.98))
         
            HeaderActions(height: height)
        }
    }
}

struct EditorHeader_Previews: PreviewProvider {
    static var previews: some View {
        EditorHeader()
            .frame(height: 25)
    }
}
