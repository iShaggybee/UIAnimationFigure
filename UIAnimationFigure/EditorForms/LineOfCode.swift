//
//  LineOfCode.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct LineOfCode: View {
    let lineType: CodeLineType
    
    var body: some View {
        switch lineType {
        case .print(let lineNumber, let value):
            HStack(spacing: 0.0) {
                Text("\(lineNumber)")
                    .foregroundColor(.gray)
                    .padding(.trailing, 10.0)
                
                Text("print")
                    .foregroundColor(Color(
                        red: 0.502,
                        green: 0.308,
                        blue: 0.722
                    )
                )
                
                Text("(\(value))")
            }
            .font(.system(.body, design: .monospaced))
        case .initial(let lineNumber, let type, let initCommand):
            HStack {
                Text("\(lineNumber)")
                    .foregroundColor(.gray)
                
                Text(type)
                    .foregroundColor(Color(
                        red: 0.68,
                        green: 0.241,
                        blue: 0.645
                    )
                )
                
                Text(initCommand)
            }
            .font(.system(.body, design: .monospaced))
        }
    }
}

struct LineOfCode_Previews: PreviewProvider {
    static var previews: some View {
        LineOfCode(lineType: .print(lineNumber: 1, value: "a * b"))
    }
}
