//
//  Expenses.swift
//  VariableExpenseTracker
//
//  Created by KBrewer on 7/12/23.
//

import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        // OOOOH we're doing this since we can't use @AppStorage on the published property!!!
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    // This is so we can separate the expense items by category
    var foodExpenses: [ExpenseItem] {
        items.filter { $0.category == "Food" }
    }
    var funExpenses: [ExpenseItem] {
        items.filter { $0.category == "Fun" }
    }
    var houseExpenses: [ExpenseItem] {
        items.filter { $0.category == "House" }
    }
    var personalExpenses: [ExpenseItem] {
        items.filter { $0.category == "Personal" }
    }
    var carExpenses: [ExpenseItem] {
        items.filter { $0.category == "Car" }
    }
    init() {
        // read data from UserDefaults
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // if we can read it, decode it as an [ExpenseItem]
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
    let categories = ["Food", "Fun", "House", "Personal", "Car"]
    /// Creates a new index set from a specific category,
    /// find the item the user selected, add it to that index set, remove that item
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        for offset in offsets {
            let item = inputArray[offset]
            if let index = items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        items.remove(atOffsets: objectsToDelete)
    }
    func removeFoodExpenses(at offsets: IndexSet) {
        removeItems(at: offsets, in: foodExpenses)
    }
    func removeFunExpenses(at offsets: IndexSet) {
        removeItems(at: offsets, in: funExpenses)
    }
    func removeHouseExpenses(at offsets: IndexSet) {
        removeItems(at: offsets, in: houseExpenses)
    }
    func removePersonalExpenses(at offsets: IndexSet) {
        removeItems(at: offsets, in: personalExpenses)
    }
    func removeCarExpenses(at offsets: IndexSet) {
        removeItems(at: offsets, in: carExpenses)
    }
}
