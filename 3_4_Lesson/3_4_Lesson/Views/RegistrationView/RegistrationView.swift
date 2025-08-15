//
//  RegistrationView.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: AuthViewModel

//    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Text("Регистрация")
                        .font(.system(size: 30, weight: .black))
                        .foregroundStyle(.white)
                        .padding(.top, geometry.size.height / 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Group {
                        TextField("Email", text: $viewModel.email)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .padding(.top, 140)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        PasswordFieldView(
                            password: $viewModel.password,
                            isVisible: $viewModel.isPasswordVisible
                        )
                        .padding(.top, 20)
                        
                        TextField("Имя", text: $viewModel.firstName)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .padding(.top, 20)
                        
                        TextField("Фамилия", text: $viewModel.lastName)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .padding(.top, 20)
                    }
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 8)
                    }
                    
                    Button(action: viewModel.register) {
                        Text("Зарегистрироваться")
                    }
                    .buttonStyle(RoundedButtonStyle())
                    .padding(.top, 48)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview("Обычное состояние") {
    RegistrationView(viewModel: AuthViewModel())
}

#Preview("С заполненными полями") {
    let vm = AuthViewModel()
    vm.email = "user@example.com"
    vm.password = "Qwerty123"
    vm.firstName = "Мария"
    vm.lastName = "Петрова"
    return RegistrationView(viewModel: vm)
}

#Preview("С ошибкой") {
    let vm = AuthViewModel()
    vm.email = "неправильный email"
    vm.password = "123"
    vm.errorMessage = "Некорректный email или пароль"
    return RegistrationView(viewModel: vm)
}
