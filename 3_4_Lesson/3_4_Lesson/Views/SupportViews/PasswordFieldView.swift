//
//  PasswordFieldView.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct PasswordFieldView: View {
    @Binding var password: String
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isVisible {
                TextField("Пароль", text: $password)
            } else {
                SecureField("Пароль", text: $password)
            }
            
            Button(action: { isVisible.toggle() }) {
                Image(systemName: isVisible ? "eye.slash" : "eye")
                    .foregroundStyle(isVisible ? .blue : .gray)
                    .padding(.trailing, 12)
            }
        }
        .frame(height: 44)
        .textFieldStyle(RoundedTextFieldStyle())
    }
}

#Preview {
    PasswordFieldView(
        password: .constant(""),
        isVisible: .constant(false)
    )
    .padding()
}
