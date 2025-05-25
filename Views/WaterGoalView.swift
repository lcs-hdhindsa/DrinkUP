//
//  WaterGoalView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-25.
//

import SwiftUI

struct WaterGoalView: View {
            
   let myWaterGoal = WaterGoal(dailyGoalLitres: 2.0, hoursAwake: 10)

    var body: some View {
        VStack{
            
            Text("WaterGoal")
                .font(.title)
                .fontWeight(.bold)
            
            VStack(alignment:.leading,spacing: 20){
                
                Text(" Daily Goal: \(myWaterGoal.dailyGoalLitres, specifier: "%.1f") litres")
                
                Text(" Hours Awake: \(myWaterGoal.hoursAwake)")
                
                Text(" You should drink...")
                
                Text(" \(myWaterGoal.waterPerHour, specifier: "%.2f") litres/hour")
                    .font(.headline)
                Text(" for \(myWaterGoal.hoursAwake) hours")
                    .font(.headline)
            }
        .multilineTextAlignment(.center)
        .padding()
        .background(RoundedRectangle(cornerRadius: 15)
        .fill(Color.blue.opacity(0.1)))
        .overlay(RoundedRectangle(cornerRadius: 15)
        .stroke(Color.blue, lineWidth: 1))
        .fixedSize(horizontal: true, vertical: false)
        }
    }
}

#Preview {
    WaterGoalView()
}
