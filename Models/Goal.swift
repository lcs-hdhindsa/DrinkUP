import Foundation

struct Goal: Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    var currentIntake: Double
    var goalIntake: Double
    var drinkFrequency: Int
    var amountPerDrink: Int
   
    var summary: String {
        """
        \(firstName) \(lastName):
        Drank: \(currentIntake)L
        Goal: \(goalIntake)L
        \(amountPerDrink)ml x \(drinkFrequency)
        """
    }
}
