//
//  MainView.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            Text("Aqui é a main!")
            
            Button("logout") {
                self.viewModel.logout()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
