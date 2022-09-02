//
//  CodeLineType.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

enum CodeLineType {
    case print(lineNumber: Int, value: String)
    case initial(lineNumber: Int, type: String, initCommand: String)
}
