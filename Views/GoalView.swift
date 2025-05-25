//
//  GoalView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-24.
//

import SwiftUI

struct GoalView: View {
    @ObservedObject var viewModel: GoalViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
                if let report = viewModel.report {
                    Text(report)
                        .multilineTextAlignment(.leading)
                        .padding()
                }
               
                Button("Start Over") {
                    viewModel.clearInputs()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Your Plan")
        }
    }
}
