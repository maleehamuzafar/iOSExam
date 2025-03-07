//
//  NoDataFallback.swift
//  iOSExam
//
//  Created by Maleeha Muzafar on 07/03/2025.
//

import SwiftUI

struct NoDataFallback: View {
    
    var icon: String = "fork.knife"
    var heading: String
    var text: String
    
    var body: some View {
        ContentUnavailableView {
            Label(heading, systemImage: icon)
        } description: {
            Text(text)
        }
    }
}
