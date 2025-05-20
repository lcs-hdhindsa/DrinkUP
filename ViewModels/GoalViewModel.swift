//
//  GoalViewModel.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import Foundation

class GoalViewModel: ObservableObject {
    
    @Published var intake: Double = 0
    @Published var times: Int = 0
    @Published var hours: Int = 0

    var goal: Goal {
        Goal(dailyIntakeLiters: intake, prefferedTimes: times, dayLengthHours: hours)
    }
}
