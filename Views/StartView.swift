//
//  StartView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-20.
//

import SwiftUI

struct StartView: View {
    var body: some View {
            NavigationStack {
                    VStack(spacing: 30) {
                    Text("DRINKUP")
                    .font(.largeTitle)
                    .fontWeight(.bold)

            NavigationLink("Start") {
                        DailyIntakeView()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
            }
        }
#Preview {
    StartView()
}
