//
//  RegistrationView.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.presentationMode) var presentationMode
    
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
                        TextField("email", text: $viewModel.login)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .padding(.top, 140)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        
                        PasswordFieldView(
                            password: $viewModel.password,
                            isVisible: $viewModel.isPasswordVisible)
                        .padding(.top, 20)
                        
                        TextField("Имя", text: $viewModel.userName)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .padding(.top, 20)
                        
                        TextField("Фамилия", text: $viewModel.userLastName)
                            .textFieldStyle(RoundedTextFieldStyle())
                            .padding(.top, 20)
                    }
                        
                    Button(action: {
                        //Правда или действие
                        viewModel.register()
                    }) {
                        Text("Регистрация")
                    }
                    .buttonStyle(RoundedButtonStyle())
                    .padding(.top, 48)
                    .disabled(!viewModel.validateFields())
                    .opacity(viewModel.validateFields() ? 1 : 0.7)
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }
        .navigationDestination(isPresented: $viewModel.isRegistrationSuccessful) {
            ContentView()
        }
    }
}

#Preview {
    RegistrationView()
}
