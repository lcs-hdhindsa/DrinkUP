//
//  ProfileManagerView.swift
//  DrinkUP
//
//  Created by Harshan Dhindsa on 2025-05-25.
//

import SwiftUI

class ProfileManager: ObservableObject {
    
    @Published var profiles: [GoalViewModel] = []
    
    func addProfile(_ profile: GoalViewModel) {
        profiles.append(profile)
    }
    
    func removeProfile(at indexSet: IndexSet) {
        profiles.remove(atOffsets: indexSet)
    }
}


