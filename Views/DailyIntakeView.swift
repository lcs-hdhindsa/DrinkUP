//
//  DailyIntakeView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI


struct DailyIntakeView: View {
    
    @State var intake: Double = 0
    @StateObject var vm = GoalViewModel()

    var body: some View {
        VStack(spacing: 20) {
            
            Text("How much water do you drink in a day?")
            
            TextField("Liters (L)", value: $intake, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)

        NavigationLink("Continue") {
                DayLengthView(vm: vm)
            }
            .onTapGesture {
                vm.intake = intake
            }
        }
        .padding()
    }
}

#Preview {
    DailyIntakeView()
}
