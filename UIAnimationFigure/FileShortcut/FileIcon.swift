//
//  FileShortcut.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 31.08.2022.
//

import SwiftUI

struct FileIcon: View {
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = geometry.size.width
            let height: CGFloat = geometry.size.height
            let aspectRatio: CGFloat = 1.3
            let midWidth = width / 2
            
            let (sizeByX, sizeByY) = calculateSize(
                width: width,
                height: height,
                aspectRatio: aspectRatio
            )
            
            ZStack(alignment: .top) {
                FileFigure(
                    midWidth: midWidth,
                    sizeByX: sizeByX,
                    sizeByY: sizeByY
                )

                Image(systemName: "swift")
                    .foregroundColor(.blue)
                    .frame(width: sizeByX, height: sizeByY)
                    .scaleEffect(sizeByX / 50)

                HStack {
                    Spacer()
                    Text("PLAYGROUND")
                        .foregroundColor(.gray)
                        .font(.caption)
                    Spacer()
                }
                .offset(x: 0, y: sizeByY - 25)
            }
        }
    }
    
    private func calculateSize(width: CGFloat, height: CGFloat, aspectRatio: CGFloat) -> (CGFloat, CGFloat) {
        var sizeByX: CGFloat!
        var sizeByY: CGFloat!
        
        if (height > width && height / width >= aspectRatio) {
            sizeByX = width
            sizeByY = width * aspectRatio
        } else {
            sizeByX = height / aspectRatio
            sizeByY = height
        }
        
        return (sizeByX, sizeByY)
    }
}

struct FileIcon_Previews: PreviewProvider {
    static var previews: some View {
        FileIcon()
            .frame(width: 100, height: 130)
            .previewInterfaceOrientation(.portrait)
    }
}
