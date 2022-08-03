//
//  ContentViewModel.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var isLogged = Auth.auth().currentUser != nil
    
    func onAppear() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLogged = user != nil
        }
    }
}
