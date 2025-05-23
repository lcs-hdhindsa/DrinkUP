//
//  StartView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct StartView: View {
    
    // MARK: Stored properties
    @State private var showForm = false
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 20) {
            
            Button("Start") {
                showForm = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(isPresented: $showForm) {
            ReportView(viewModel: GoalViewModel())
                .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    StartView()
}
