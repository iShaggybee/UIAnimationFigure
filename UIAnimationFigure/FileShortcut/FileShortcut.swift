//
//  FileShortcut.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 31.08.2022.
//

import SwiftUI

struct FileShortcut: View {
    var body: some View {
        VStack(alignment: .center) {
            FileIcon()
                .frame(width: 100, height: 130)
            
            Text("Animation.playground")
                .foregroundColor(Color(
                    hue: 1.0,
                    saturation: 0.0,
                    brightness: 0.212
                ))
                .fontWeight(.regular)
                .font(.callout)
                .padding(.top, 5)
        }
    }
}

struct FileShortcut_Previews: PreviewProvider {
    static var previews: some View {
        FileShortcut()
    }
}
