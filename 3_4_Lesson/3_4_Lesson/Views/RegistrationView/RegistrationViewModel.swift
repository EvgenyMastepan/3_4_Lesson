//
//  RegistrationViewModel.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var login = ""
    @Published var password = ""
    @Published var userName = ""
    @Published var userLastName = ""
    @Published var isPasswordVisible = false
    @Published var isRegistrationSuccessful = false
    
    // Проверяем почту
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Проверяем пароль
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6 &&
               password.rangeOfCharacter(from: .letters) != nil &&
               password.rangeOfCharacter(from: .decimalDigits) != nil
    }
    
    // Проверяем поля и логин/пароль
    func validateFields() -> Bool {
        return !login.isEmpty &&
               !password.isEmpty &&
               !userName.isEmpty &&
               !userLastName.isEmpty &&
               isValidEmail(login) &&
               isValidPassword(password)
    }
    
    // MARK: -- Тут типа регистрация будет производиться.
    func register() {
        guard validateFields() else { return }
        
        // Тут сохраняем данные в базу или вызываем API.
        
        DispatchQueue.main.async {
            self.isRegistrationSuccessful = true
        // Ура! Всё случилось.
        }
    }
    
    
}
