//
//  ItemView.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 05/03/2025.
//

import SwiftUI

struct ItemView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo.fill")
                Text("Label")
                    .frame(maxWidth: .infinity)
            }
            Divider()
                .overlay(Color(.systemGray))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ItemView()
}
