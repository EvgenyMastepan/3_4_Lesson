//
//  ContentView.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Text("Авторизация")
                        .font(.system(size: 30, weight: .black))
                        .foregroundStyle(.white)
                        .padding(.top, geometry.size.height / 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("email", text: $login)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .padding(.top, 140)
                    
                    ZStack(alignment: .trailing) {
                        if isPasswordVisible {
                            TextField("Пароль", text: $password)
                                .frame(height: 44)
                        } else {
                            SecureField("Пароль", text: $password)
                                .frame(height: 44)
                        }
                        
                        Button(action: {
                            withAnimation {
                                isPasswordVisible.toggle()
                            }
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundStyle(isPasswordVisible ? .blue : .gray)
                                .padding(.trailing, 12)
                        }
                    }
                    .textFieldStyle(RoundedTextFieldStyle())
                    .padding(.top, 20)
                    
                    Button(action: {
                        //Правда или действие
                    }) {
                        Text("Войти")
                    }
                    .buttonStyle(RoundedButtonStyle())
                    .padding(.top, 48)
                    
                    Button(action: {
                        //Действие
                    }) {
                        Text("Регистрация")
                            .underline()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .font(.system(size: 16, weight: .regular))
                            .padding(.top, 40)
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    ContentView()
}
