//
//  GoalView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-24.
//

import SwiftUI

struct GoalView: View {
    @ObservedObject var viewModel: GoalViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                if let report = viewModel.report {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(report)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.blue.opacity(0.1))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
                
                if let goal = viewModel.currentGoal {
                    WaterGoalView(
                        dailyGoal: goal.goalIntake,
                        hoursAwake: Int(viewModel.hoursAwake) ?? 16
                    )
                }
               
                Button("Create New Plan") {
                    viewModel.clearInputs()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .navigationTitle("Your Water Plan")
        .navigationBarTitleDisplayMode(.large)
    }
}


