//
//  MainViewModel.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    
    func logout() {
            try? Auth.auth().signOut()
    }
}
