//
//  ContentView.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ItemView()
                ItemView()
                ItemView()
            }
        }
    }
}

#Preview {
    ContentView()
}
