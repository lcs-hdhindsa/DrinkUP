//
//  DayLengthView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct DayLengthView: View {
   
    @ObservedObject var vm: GoalViewModel
    @State private var hours: Int = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("How long is your normal day?")
            TextField("Hours (e.g. 8)", value: $hours, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            NavigationLink("Continue") {
                DrinkFrequencyView(vm: vm)
            }
            .onTapGesture {
                vm.hours = hours
            }
        }
        .padding()
    }
}

