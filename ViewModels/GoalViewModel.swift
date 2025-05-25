//
//  GoalViewModel.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

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
    @Published var hoursAwake: String = "16" // Default waking hours

    @Published var currentGoal: Goal?

    func generateReport() {
        guard let current = Double(currentIntake),
              let goal    = Double(goalIntake),
              let times   = Int(drinkFrequency),
              let hours = Int(hoursAwake),
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
         currentGoal = newGoal
               
               let waterGoal = WaterGoal(dailyGoalLitres: goal, hoursAwake: hours)
              
               report = """
               Water Plan for \(firstName):
               
               Current vs Goal:
               You currently drink: \(current)L
               Your goal: \(goal)L
               
               Drinking Schedule:
               Drink \(perDrink)ml
               \(times) times per day
               Every \(waterGoal.waterPerHour) litres/hour
               Over \(hours) waking hours
               
               \(current < goal ? "You need \(goal - current)L more to reach your goal!" : "You're meeting your goal!")
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

class ProfileManager: ObservableObject {
    @Published var profiles: [GoalViewModel] = []
    
    func addProfile(_ profile: GoalViewModel) {
        profiles.append(profile)
    }
    
    func removeProfile(at indexSet: IndexSet) {
        profiles.remove(atOffsets: indexSet)
    }
}
