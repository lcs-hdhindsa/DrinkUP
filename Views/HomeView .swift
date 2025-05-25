//
//  HomeView .swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var profileManager = ProfileManager()
    @State var showingStartView = false

    var body: some View {
        NavigationView {
            VStack {
                
                if profileManager.profiles.isEmpty {
                    VStack(spacing: 20) {
                        Image(systemName: "drop.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.blue)
                        
                       
                    Text("No Water Goals Yet")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                    Text("Create your first water drinking goal to get started")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                        
                    Button("Create Your First Goal") {
                            showingStartView = true
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    List {
                        ForEach(profileManager.profiles.indices, id: \.self) { index in
                            NavigationLink(destination: GoalView(viewModel: profileManager.profiles[index])) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(profileManager.profiles[index].firstName.isEmpty ? "Unnamed Profile" : "\(profileManager.profiles[index].firstName) \(profileManager.profiles[index].lastName)")
                                        .font(.headline)
                                    
                                    if let goal = profileManager.profiles[index].currentGoal {
                                        Text("Goal: \(goal.goalIntake, specifier: "%.1f")L daily")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            profileManager.removeProfile(at: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Drink Up")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Goal") {
                        showingStartView = true
                    }
                }
            }
            .sheet(isPresented: $showingStartView) {
                StartView(viewModel: GoalViewModel()) { completedProfile in
                    profileManager.addProfile(completedProfile)
                    showingStartView = false
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
