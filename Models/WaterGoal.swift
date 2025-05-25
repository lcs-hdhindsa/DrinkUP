//
//  WaterGoal.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-25.
//

import Foundation

struct WaterGoal {
    
    // Stored properties
    var dailyGoalLitres: Double
    var hoursAwake: Int

    
    // Computed property
    var waterPerHour: Double {
        
        return dailyGoalLitres / Double(hoursAwake)
    }
}
