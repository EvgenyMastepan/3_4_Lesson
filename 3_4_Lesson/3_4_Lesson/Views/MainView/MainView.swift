//
//  MainView.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    
                    Text("Приветствую")
                        .font(.system(size: 30, weight: .black))
                        .foregroundStyle(.white)
                        .padding(.top, geometry.size.height / 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(viewModel.firstName)
                        .font(.system(size: 30, weight: .black))
                        .foregroundStyle(.white)
                        .padding(.top, 21)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button("Выйти") {
                        viewModel.logout()
                    }
                    .buttonStyle(RoundedButtonStyle())
                    .padding(.bottom, 102)
                }
                .padding(.horizontal, 30)
            }
        }
    }
}

#Preview("Обычное состояние") {
    MainView(viewModel: AuthViewModel())
}

#Preview("С заполненными полями") {
    let vm = AuthViewModel()
    vm.email = "user@example.com"
    vm.password = "Qwerty123"
    vm.firstName = "Мария"
    vm.lastName = "Петрова"
    return MainView(viewModel: vm)
}
