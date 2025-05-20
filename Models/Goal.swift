//
//  Goal.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import Foundation

struct Goal: Identifiable {
    
    var id = UUID()
    var dailyIntakeLiters: Double
    var prefferedTimes: Int
    var dayLengthHours: Int
    
    var amountPerDrink: Double {
        (dailyIntakeLiters * 1000) / Double(prefferedTimes)
    }
    
    var intervalHours: Double {
        Double(dayLengthHours) / Double(prefferedTimes)
    }
}

    
