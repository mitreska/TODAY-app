//
//  ContentView.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewmodel = ContentViewModel()
    
    var body: some View {
        ZStack {
            if viewmodel.isLogged {
                MainView()
            } else {
                AuthView()
            }
        }.onAppear {
            viewmodel.onAppear()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
