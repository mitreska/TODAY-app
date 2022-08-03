//
//  SignUpViewModel.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    
    @Published var formInvalid = false
    @Published var isLoading = false
    var alertText = ""
    
    func signUp() {
        self.isLoading = true
        if password.count >= 6 {
            if password == passwordConfirmation {
                Auth.auth().createUser(withEmail: email, password: password) {
                    result, err in
                    guard let user = result?.user, err == nil else {
                        self.formInvalid = true
                        self.alertText = err!.localizedDescription
                        self.isLoading = false
                        return
                    }
                    // fazer a chamada para criar o perfil do usuário. No Firebase FireStore:
                    self.isLoading = false
                }
            } else {
                self.isLoading = false
                self.formInvalid = true
                self.alertText = "As senhas não são iguais."
            }
        } else {
            self.isLoading = false
            self.formInvalid = true
            self.alertText = "A senha precisa ter mais que 6 caracteres."
        }
        
    }
}
