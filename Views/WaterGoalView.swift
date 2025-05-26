//
//  WaterGoalView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-25.
//

import SwiftUI

struct WaterGoalView: View {
    let dailyGoal: Double
    let hoursAwake: Int
    
    var waterGoal: WaterGoal {
        WaterGoal(dailyGoalLitres: dailyGoal, hoursAwake: hoursAwake)
    }

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Hourly Breakdown")
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .center, spacing: 12) {
                Text("Daily Goal: \(waterGoal.dailyGoalLitres, specifier: "%.1f") litres")
                    .font(.headline)
                
                Text("Hours Awake: \(waterGoal.hoursAwake)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text("You should drink:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(waterGoal.waterPerHour, specifier: "%.2f") litres/hour")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Text("for \(waterGoal.hoursAwake) hours")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .multilineTextAlignment(.center)
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
}

#Preview {
    WaterGoalView(dailyGoal: 8, hoursAwake: 9)
}

