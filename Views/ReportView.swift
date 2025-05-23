//
//  ReportView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct ReportView:
                    View {
    
    // MARK: Stored properties
    @ObservedObject var viewModel: GoalViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Your Info")) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                }
                
                Section(header: Text("Your Habits")) {
                    TextField("How much water you drink? (ML)", text: $viewModel.currentIntake)
                        .keyboardType(.decimalPad)
                    TextField("How long is your day? (hours)", text: $viewModel.dayLength)
                        .keyboardType(.numberPad)
                    TextField("How many times you drink in a day", text: $viewModel.drinkFrequency)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Water Goal")) {
                    TextField("Water goal (L)", text: $viewModel.goalIntake)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Submit") {
                        viewModel.generateReport()
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                if let report = viewModel.report {
                    Section(header: Text("Your Report")) {
                        Text(report)
                            .padding(.top)
                    }
                }
            }
            .navigationTitle("Your Profile")
        }
    }
}

