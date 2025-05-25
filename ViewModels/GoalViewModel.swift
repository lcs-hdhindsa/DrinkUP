//
//  GoalViewModel.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import Foundation
import SwiftUI

class GoalViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var currentIntake: String = ""
    @Published var dayLength: String = ""
    @Published var drinkFrequency: String = ""
    @Published var goalIntake: String = ""

    @Published var goals: [Goal] = []
    @Published var report: String? = nil

    func generateReport() {
        guard let current = Double(currentIntake),
              let goal    = Double(goalIntake),
              let times   = Int(drinkFrequency),
              !firstName.isEmpty
        else {
            report = "Please try agian."
            return
        }
       
        let perDrink = Int((goal * 1_000) / Double(times))
        let newGoal = Goal(
            firstName: firstName,
            lastName: lastName,
            currentIntake: current,
            goalIntake: goal,
            drinkFrequency: times,
            amountPerDrink: perDrink
        )
        goals.append(newGoal)
       
        report = """
        Water Plan for \(firstName):
        You drink: \(current)L
        Goal: \(goal)L
        Drink: \(perDrink)ml x \(times)
        """
    }
   
    func clearInputs() {
        firstName = ""
        lastName = ""
        currentIntake = ""
        dayLength = ""
        drinkFrequency = ""
        goalIntake = ""
        report = nil
    }
}
