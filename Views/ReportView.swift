//
//  ReportView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

// USED CHATGPT FOR REPORT DATA: https://chatgpt.com/c/682df251-8b3c-8009-b0b9-06ad6c0f0e86

struct ReportView: View {
     
    let goal: Goal

        var body: some View {
            
            VStack(spacing: 20) {
                Text("Here is your report")
                    .font(.title2)
                    .padding()

            Text("You drink around… \(Int(goal.dailyIntakeLiters * 1000)) ml")
            
            Text("Your goal is… \(goal.dailyIntakeLiters, specifier: "%.2f") L")
            
            Text("You want to drink… \(goal.prefferedTimes) times a day")
            
            Text("So you need to drink… \(Int(goal.amountPerDrink)) ml every \(Int(goal.intervalHours)) hours")

            Spacer()
            }
        .padding()
        }
    }

