//
//  SignUpView.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Insira o seu nome", text: $viewModel.name)
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22.0)
                            .strokeBorder(Color(UIColor.separator)
                                          ,style: StrokeStyle(lineWidth: 1.0))
                    )
                TextField("Insira o seu e-mail", text: $viewModel.email)
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22.0)
                            .strokeBorder(Color(UIColor.separator)
                                          ,style: StrokeStyle(lineWidth: 1.0))
                    )
                SecureField("Insira uma senha", text: $viewModel.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 22.0)
                            .strokeBorder(Color(UIColor.separator)
                                          ,style: StrokeStyle(lineWidth: 1.0))
                    )
                
                SecureField("Confirme sua senha", text: $viewModel.passwordConfirmation)
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
                    viewModel.signUp()
                } label: {
                    Text("Criar conta")
                        .frame(maxWidth: .infinity, minHeight: 55.0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(24.0)
                        .padding()
                }.alert(isPresented: $viewModel.formInvalid) {
                    Alert(title: Text(viewModel.alertText))
                }
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
