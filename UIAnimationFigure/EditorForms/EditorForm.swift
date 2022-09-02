//
//  EditorForm.swift
//  UIAnimationFigure
//
//  Created by Kislov Vadim on 01.09.2022.
//

import SwiftUI

struct EditorForm: View {
    var body: some View {
        VStack(spacing: 0.0) {
            let firstMultiplier = 5
            let secondMultiplier = 4
            
            EditorHeader()
                .frame(height: 25)
            
            EditorBody(
                firstMultiplier: firstMultiplier,
                secondMultiplier: secondMultiplier
            )
                .frame(height: 200)
            
            Divider()
            
            EditorFooter(value: firstMultiplier * secondMultiplier)
                .frame(height: 40)
        }
        .shadow(
            color: Color(hue: 1.0, saturation: 0.0, brightness: 0.826),
            radius: 3,
            x: 0,
            y: 4
        )
    }
}

struct EditorForm_Previews: PreviewProvider {
    static var previews: some View {
        EditorForm()
    }
}
