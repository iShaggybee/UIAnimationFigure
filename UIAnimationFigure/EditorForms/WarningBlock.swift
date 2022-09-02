//
//  WarningBlock.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 02.09.2022.
//

import SwiftUI

struct WarningBlock: View {
    let variableName: String
    
    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.triangle")
                .foregroundColor(Color(red: 0.983, green: 0.73, blue: 0.0))
            
            Text("Variable '\(variableName)' was never mutated; consider changing to 'let' constant")
                .font(.system(.caption, design: .monospaced))
                .lineLimit(1)
        }
        .background(Color(red: 0.993, green: 0.92, blue: 0.675))
        .clipShape(RoundedRectangle(cornerRadius: 3))
    }
}

struct WarningBlock_Previews: PreviewProvider {
    static var previews: some View {
        WarningBlock(variableName: "a")
    }
}
