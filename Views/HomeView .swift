//
//  HomeView .swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-24.
//

import SwiftUI

struct HomeView: View {
    @State var profiles: [GoalViewModel] = []
    @State var showingStartView = false
    @State var selectedProfile: GoalViewModel?

    var body: some View {
        NavigationView {
            List {
                ForEach(profiles.indices, id: \.self) { index in
                    NavigationLink(destination: GoalView(viewModel: profiles[index])) {
                        Text(profiles[index].firstName.isEmpty ? "Unnamed Profile" : profiles[index].firstName)
                    }
                }
                .onDelete { indexSet in
                    profiles.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("My Goals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        selectedProfile = GoalViewModel()
                        showingStartView = true
                    }
                }
            }
            .sheet(isPresented: $showingStartView) {
                if let profile = selectedProfile {
                    StartView(viewModel: profile) {
                        profiles.append(profile)
                        showingStartView = false
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
