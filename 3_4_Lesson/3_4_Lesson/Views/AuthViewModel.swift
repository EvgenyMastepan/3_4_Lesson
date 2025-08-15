//
//  AuthViewModel.swift
//  3_4_Lesson
//
//  Created by Evgeny Mastepan on 15.08.2025.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""

    @Published var isPasswordVisible = false
    @Published var isAuthenticated = false
    @Published var showRegistration = false
    @Published var errorMessage = ""
    
    // MARK: == Тестовые пользователи. Удалить после отладки!
    private let testUsers = [
        (email: "test@test.com", password: "Pass123", firstName: "Тест", lastName: "Тестовович"),
        (email: "ezhi@smesh.com", password: "Krosh789", firstName: "Егор", lastName: "Задунайскый"),
        (email: "test@example.com", password: "Qwerty456", firstName: "Прохор", lastName: "Замоскворецкий"),
    ]
    
    // Проверяем логин
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Проверяем пароль
    func isValidPassword() -> Bool {
        return password.count >= 6 &&
               password.rangeOfCharacter(from: .letters) != nil &&
               password.rangeOfCharacter(from: .decimalDigits) != nil
    }
    
    // Вход
    func login() {
        guard !email.isEmpty && !password.isEmpty else {
            errorMessage = "Заполните все поля"
            return
        }
        
        guard isValidEmail() else {
            errorMessage = "Введите корректный email"
            return
        }
        
        if let user = testUsers.first(where: { $0.email == email && $0.password == password }) {
            self.firstName = user.firstName
            self.lastName = user.lastName
            self.isAuthenticated = true
            errorMessage = ""
        } else {
            errorMessage = "Неверный email или пароль"
            isAuthenticated = false
        }
    }
    
        // Регистрация
    func register() {
        guard !email.isEmpty && !password.isEmpty && !firstName.isEmpty && !lastName.isEmpty else {
            errorMessage = "Заполните все поля"
            return
        }
        
        guard isValidEmail() else {
            errorMessage = "Некорректный email"
            return
        }
        
        guard isValidPassword() else {
            errorMessage = "Пароль должен содержать 6+ символов, буквы и цифры"
            return
        }
        
        // Здесь мы лезем в сеть или в БД чтобы вызнать настоящих юзверей.
        isAuthenticated = true // Временная заглушка. Удалить после добавления истинных ценностей и смысла жизни.
    }
    
    // Заметаем следы
    func logout() {
        email = ""
        password = ""
        firstName = ""
        lastName = ""
        isAuthenticated = false
    }
    
}
