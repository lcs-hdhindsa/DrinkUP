//
//  DrinkFrequencyView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct DrinkFrequencyView: View {
   
    @ObservedObject var vm: GoalViewModel
    @State private var times: Int = 0

    var body: some View {
        
        VStack(spacing: 20) {
                
            Text("How many times do you want to drink water?")
                
            TextField("Times (#)", value: $times, formatter: NumberFormatter())
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)

                NavigationLink("See Report") {
                    ReportView(goal: vm.goal)
                }
                .onTapGesture {
                    vm.times = times
                }
            }
            .padding()
        }
    }

