//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by 黒川龍之介 on 2022/11/12.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAlert = false
    
    var body: some View {

        Button("Show Alert"){
            showingAlert = true
        }
        .alert("importanet Message", isPresented: $showingAlert){
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please read this.")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
