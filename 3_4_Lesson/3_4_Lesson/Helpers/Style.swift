//
//  Style.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(14)
            .background(Color.white)
            .foregroundStyle(.black)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .font(.system(size: 16))
    }
}

struct RoundedButtonStyle: ButtonStyle {
    var backgroundColor: Color = .btn
    var foregroundColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .font(.system(size: 16, weight: .semibold))
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
