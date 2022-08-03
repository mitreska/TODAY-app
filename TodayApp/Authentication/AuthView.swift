//
//  AuthView.swift
//  TodayApp
//
//  Created by Mikha's Book on 02/08/22.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Insira o seu e-mail", text: $viewModel.authModel.email)
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22.0)
                            .strokeBorder(Color(UIColor.separator)
                                          ,style: StrokeStyle(lineWidth: 1.0))
                    )
                SecureField("Insira a sua senha", text: $viewModel.authModel.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 22.0)
                            .strokeBorder(Color(UIColor.separator)
                                          ,style: StrokeStyle(lineWidth: 1.0))
                    )
                
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
                
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Entrar")
                        .frame(maxWidth: .infinity, minHeight: 55.0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                        .padding()
                }.alert(isPresented: $viewModel.formInvalid) {
                    Alert(title: Text(viewModel.alertText))
                }
                
                Divider()
                
                NavigationLink(destination: SignUpView()){
                    Text("Não tem uma conta? Crie sua conta")
                        .foregroundColor(Color.black)
                }.padding()
                
            }
            .padding(.horizontal, 23.0)
            .navigationBarHidden(true)
            .navigationTitle("Login")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
