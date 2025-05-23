//
//  GoalViewModel.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import Foundation

class GoalViewModel: ObservableObject {
    
    // MARK: Input fields
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var currentIntake = ""
    @Published var dayLength = ""
    @Published var drinkFrequency = ""
    @Published var goalIntake = ""
    
    // MARK: Output
    @Published var report: String?
    
    // MARK: Methods
    func generateReport() {
        
        guard
            let current = Double(currentIntake),
            let goal = Double(goalIntake),
            let times = Double(drinkFrequency),
            let hours = Double(dayLength)
        else {
            report = "Please enter valid numbers in all fields."
            return
        }
        
        let perDrink = Int((goal * 1000) / times)
        
        report = """
        \(firstName) \(lastName)
        
        Current Intake: \(current)L
        Goal Intake: \(goal)L
        Drinks per day: \(Int(times))
        Day length: \(Int(hours)) hours
        
        You need to drink \(perDrink) ml each time.
        """
    }
}

