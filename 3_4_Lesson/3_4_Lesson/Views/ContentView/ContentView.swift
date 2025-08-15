//
//  ContentView.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    VStack {
                        Text("Авторизация")
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
                        }
                        
                        Button(action: viewModel.login) {
                            Text("Войти")
                        }
                        .buttonStyle(RoundedButtonStyle())
                        .padding(.top, 48)
                        
                        Button(action: {
                            viewModel.showRegistration = true
                        }) {
                            Text("Регистрация")
                                .underline()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .regular))
                                .padding(.top, 40)
                        }
                        
                        Spacer()
                        // Обработка ошибок.
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                                .padding(.top, 8)
                        }
                    }
                    .padding(.horizontal, 30)
                }
            }
            .navigationDestination(isPresented: $viewModel.isAuthenticated) {
                MainView(viewModel: viewModel)
            }
            .navigationDestination(isPresented: $viewModel.showRegistration) {
                RegistrationView(viewModel: viewModel)
            }
        }
    }
}


#Preview {
    ContentView()
}
