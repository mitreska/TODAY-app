//
//  AuthViewModel.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var authModel = AuthModel()
    
    @Published var formInvalid = false
    @Published var isLoading = false
    var alertText = ""
    
    
    func signIn() {
        self.isLoading = true
        if authModel.password.count >= 6 {
            Auth.auth().signIn(withEmail: authModel.email, password: authModel.password) { result, err in
                guard let user = result?.user, err == nil else {
                    self.formInvalid = true
                    self.isLoading = false
                    self.alertText = err!.localizedDescription
                    return
                }
                self.isLoading = false
            }
        } else {
            self.isLoading = false
            self.formInvalid = true
            self.alertText = "A senha precisa ter mais que 6 caracteres."
        }
    }
}
