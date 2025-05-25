//
//  StartView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct StartView: View {
    
    @StateObject  var viewModel = GoalViewModel()
    @State  var step = 1
    @State  var showSummary = false
   
    var onFinish: () -> Void = {}  
    
    var body: some View {
        Group {
            
            if showSummary {
                GoalView(viewModel: viewModel)
                    .onAppear {
                        onFinish()
                    }
                } else {
                questionStepper
            }
        }
        .animation(.default, value: showSummary)
    }
   
      var questionStepper: some View {
        VStack(spacing: 20) {
            Text(currentQuestionTitle)
                .font(.headline)
                .padding(.top)
                
            TextField(currentPlaceholder, text: currentBinding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(currentKeyboardType)
                .padding(.horizontal)
           
            HStack {
                if step > 1 {
                    Button("Back") { step -= 1 }
                        .padding(.leading)
                }
               
                Spacer()
               
                Button(step == 5 ? "Finish" : "Next") {
                    if step < 5 {
                        step += 1
                    } else {
                        viewModel.generateReport()
                        showSummary = true
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding(.trailing)
            }
           
            Spacer()
        }
        .padding(.vertical)
    }
   
   var currentQuestionTitle: String {
        
        switch step {
        case 1: return "What's your first name?"
        case 2: return "What's your last name?"
        case 3: return "How much water do you drink a day? (L)"
        case 4: return "How many times do you drink water per day?"
        case 5: return "What's your water goal for the day? (L)"
        default: return ""
        }
    }
   
    var currentPlaceholder: String {
        
        switch step {
        case 1: return "First name"
        case 2: return "Last name"
        case 3: return "e.g. 1.2"
        case 4: return "e.g. 6"
        case 5: return "e.g. 2.0"
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
    StartView()
}
