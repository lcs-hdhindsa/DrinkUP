//
//  StartView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel: GoalViewModel
    @State var step = 1
    @State var showSummary = false
    @Environment(\.dismiss) var dismiss
   
    var onFinish: (GoalViewModel) -> Void 
    
    var body: some View {
        NavigationView {
            Group {
                if showSummary {
                    GoalView(viewModel: viewModel)
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Done") {
                                    onFinish(viewModel)
                                    dismiss()
                                }
                            }
                        }
                } else {
                    questionStepper
                        .navigationTitle("Setup Your Goal")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Cancel") {
                                    dismiss()
                                }
                            }
                        }
                }
            }
        }
        .animation(.default, value: showSummary)
    }
   
    var questionStepper: some View {
        VStack(spacing: 30) {
            ProgressView(value: Double(step), total: 6)
                .padding(.horizontal)
            
            Text("Step \(step) of 6")
                .font(.caption)
                .foregroundColor(.secondary)
            
            Text(currentQuestionTitle)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            TextField(currentPlaceholder, text: currentBinding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(currentKeyboardType)
                .padding(.horizontal)
           
            HStack {
                if step > 1 {
                    Button("Back") {
                        step -= 1
                    }
                    .buttonStyle(.bordered)
                }
               
                Spacer()
               
                Button(step == 6 ? "Create Plan" : "Next") {
                    if step < 6 {
                        step += 1
                    } else {
                        viewModel.generateReport()
                        showSummary = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .disabled(currentBinding.wrappedValue.isEmpty)
            }
            .padding(.horizontal)
           
            Spacer()
        }
        .padding(.vertical)
    }
   
    var currentQuestionTitle: String {
        switch step {
        case 1: return "What's your first name?"
        case 2: return "What's your last name?"
        case 3: return "How much water do you currently drink per day?"
        case 4: return "How many times do you drink water per day?"
        case 5: return "What's your daily water goal?"
        case 6: return "How many hours are you awake per day?"
        default: return ""
        }
    }
   
    var currentPlaceholder: String {
        switch step {
        case 1: return "First name"
        case 2: return "Last name"
        case 3: return "(litres)"
        case 4: return "(times)"
        case 5: return "(litres)"
        case 6: return "(hours)"
        default: return ""
        }
    }
   
    var currentBinding: Binding<String> {
        switch step {
        case 1: return $viewModel.firstName
        case 2: return $viewModel.lastName
        case 3: return $viewModel.currentIntake
        case 4: return $viewModel.drinkFrequency
        case 5: return $viewModel.goalIntake
        case 6: return $viewModel.hoursAwake
        default: return .constant("")
        }
    }
   
    var currentKeyboardType: UIKeyboardType {
        switch step {
        case 1, 2: return .default
        default: return .decimalPad
        }
    }
}

#Preview {
    StartView(viewModel: GoalViewModel()) { _ in
    }
}
